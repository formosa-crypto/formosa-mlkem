#!/usr/bin/env python3
"""Persistent EC daemon (mlkem) — raw passthrough to `easycrypt llm`.

Run from formosa-mlkem so the EC subprocess inherits cwd and picks up
the project file's load paths. Workflow:

  1. Client writes one or more EC LLM commands to ec_in (one transaction
     = one writer open/close).
  2. Daemon forwards bytes verbatim to the EC subprocess.
  3. Daemon reads N <END>-terminated responses from EC, where N is the
     count of commands in the input, and concatenates them to ec_out.

Counting commands: a line is a command if it ends with '.' (a tactic
sentence) or starts with an EC meta keyword (LOAD/UNDO/REVERT/
CHECKPOINT/GOALS/QUIT/SEARCH/HELP/QUIET). Multi-line tactics span
multiple input lines but contribute one '.' at the end, so they count
as one. Blank lines are skipped.

No JSON envelope, no per-command parsing — error messages, uuids, and
the <END> sentinel pass through unchanged.
"""
import os
import re
import stat
import subprocess
import sys

D = os.path.dirname(os.path.abspath(__file__))
IN_FIFO  = os.path.join(D, 'ec_in')
OUT_FIFO = os.path.join(D, 'ec_out')
LOG_FILE = os.path.join(D, 'ec_daemon.log')

META_RE = re.compile(r'^\s*(LOAD|UNDO|REVERT|CHECKPOINT|GOALS|QUIT|SEARCH|HELP|QUIET)\b')

def ensure_fifo(p):
    if os.path.exists(p) and not stat.S_ISFIFO(os.stat(p).st_mode):
        os.remove(p)
    if not os.path.exists(p):
        os.mkfifo(p)

ensure_fifo(IN_FIFO)
ensure_fifo(OUT_FIFO)

def count_commands(text):
    n = 0
    for line in text.split('\n'):
        s = line.strip()
        if not s:
            continue
        if META_RE.match(s) or s.endswith('.'):
            n += 1
    return n

ec = subprocess.Popen(
    ['easycrypt', 'llm', '-p', 'Z3', '-timeout', '5'],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True,
    bufsize=1,
)

log = open(LOG_FILE, 'w', buffering=1)

def read_response():
    chunks = []
    for line in ec.stdout:
        chunks.append(line)
        if line.rstrip() == '<END>':
            break
    return ''.join(chunks)

# Drain initial READY banner.
log.write(read_response())

quit_seen = False
while not quit_seen:
    try:
        with open(IN_FIFO, 'r') as fi:
            req = fi.read()
    except KeyboardInterrupt:
        break
    if not req.strip():
        continue
    log.write('>>> ' + req + ('' if req.endswith('\n') else '\n'))
    ec.stdin.write(req if req.endswith('\n') else req + '\n')
    ec.stdin.flush()
    n = count_commands(req)
    if n == 0:
        n = 1
    parts = []
    for _ in range(n):
        r = read_response()
        parts.append(r)
        if not r:
            break
    resp = ''.join(parts)
    log.write('<<< ' + resp)
    with open(OUT_FIFO, 'w') as fo:
        fo.write(resp)
    if re.search(r'\bQUIT\b', req.upper()):
        quit_seen = True

ec.wait()
log.close()
