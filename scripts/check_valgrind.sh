#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

# --- Configuration ---
LOG_SUFFIX=".out"
ERROR_SUFFIX=".out.error"
LOG_DIR="./tests/valgrind/bin"
SUMMARY_FILE="${GITHUB_STEP_SUMMARY:-/dev/stdout}"

# --- Logic ---

echo "## Valgrind Memory and Leak Check Report" >> "$SUMMARY_FILE"
echo '| **Implementation** | **Status** | **Errors** |' >> "$SUMMARY_FILE"
echo '| :--- | :---: | :---: |' >> "$SUMMARY_FILE"

FAILURE_COUNT=0
TOTAL_FAILURES=0
FOUND_FILES=0

shopt -s nullglob

for LOG_FILE in "$LOG_DIR"/*"$LOG_SUFFIX" "$LOG_DIR"/*"$ERROR_SUFFIX"; do
    FOUND_FILES=1

    FILENAME="$(basename "$LOG_FILE")"

    if [[ "$FILENAME" == *"$ERROR_SUFFIX" ]]; then
        # Strip ".out.error"
        BASENAME="${FILENAME%$ERROR_SUFFIX}"

        ERROR_SUMMARY="$(grep "ERROR SUMMARY: " "$LOG_FILE" || true)"
        ERRORS="$(echo "$ERROR_SUMMARY" | grep -oP 'ERROR SUMMARY: \K[0-9]+' || true)"

        FAILURE_COUNT=$((FAILURE_COUNT + 1))

        if [ -z "$ERRORS" ]; then
            ERROR_STATUS="❌ unknown"
        else
            ERROR_STATUS="❌ $ERRORS"
            TOTAL_FAILURES=$((TOTAL_FAILURES + ERRORS))
        fi

        echo "| **$BASENAME** | ❌ FAIL | $ERROR_STATUS |" >> "$SUMMARY_FILE"
    else
        # Strip ".out"
        BASENAME="${FILENAME%$LOG_SUFFIX}"

        echo "| **$BASENAME** | ✅ PASS | ✅ 0 |" >> "$SUMMARY_FILE"
    fi
done

shopt -u nullglob

echo "---"

if [ "$FOUND_FILES" -eq 0 ]; then
    echo "Summary: No log files found in $LOG_DIR."
    exit 1
fi

if [ "$FAILURE_COUNT" -gt 0 ]; then
    echo "Summary: $FAILURE_COUNT target(s) FAILED memory checks ($TOTAL_FAILURES total parsed error(s)). Job is failing."
    exit 1
else
    echo "Summary: All targets passed memory checks."
fi
