#!/usr/bin/env python3
import argparse
from pathlib import Path

OPS = [
    ("keypair_derand", "keygen"),
    ("enc_derand", "encaps"),
    ("dec", "decaps"),
]


def parse_table(path: Path):
    rows = []
    lines = path.read_text(encoding="utf-8").splitlines()
    in_table = False
    for line in lines:
        if "| implem." in line or "|              implem." in line or "|        cpu |" in line:
            in_table = True
            continue
        if not in_table:
            continue
        if not line.strip().startswith("|"):
            if rows:
                break
            continue
        if set(line.replace("|", "").replace(":", "").replace("-", "").strip()) == set():
            continue
        cols = [c.strip().replace("\xa0", " ") for c in line.strip().strip("|").split("|")]
        if len(cols) == 7:
            _, impl, *vals = cols
        elif len(cols) == 6:
            impl, *vals = cols
        else:
            continue
        if impl in ("implem.", ""):
            continue
        rows.append({
            "impl": impl,
            "keypair": int(vals[0]),
            "keypair_derand": int(vals[1]),
            "enc": int(vals[2]),
            "enc_derand": int(vals[3]),
            "dec": int(vals[4]),
        })
    if not rows:
        raise SystemExit(f"no benchmark rows found in {path}")
    return rows


def esc(text: str):
    return (
        text.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace('"', "&quot;")
    )


def family(impl: str):
    if impl.startswith("f."):
        return "formosa"
    if impl.startswith("nat."):
        return "native"
    if impl.startswith("libcrux"):
        return "libcrux"
    if impl.startswith("pqc."):
        return "pqc"
    if impl.startswith("pqcp."):
        return "pqcp"
    return "other"


def colors(impl: str):
    fam = family(impl)
    mapping = {
        "formosa": ("#0f766e", "#99f6e4"),
        "native": ("#b45309", "#fcd34d"),
        "libcrux": ("#1d4ed8", "#93c5fd"),
        "pqc": ("#b91c1c", "#fecaca"),
        "pqcp": ("#475569", "#cbd5e1"),
        "other": ("#374151", "#d1d5db"),
    }
    return mapping[fam]


def variant_of(impl: str):
    if "768" in impl:
        return "768"
    if "1024" in impl:
        return "1024"
    return None


def svg_header(width, height):
    return [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#f8fafc"/>',
        '<style>',
        'text { font-family: "DejaVu Sans", "Liberation Sans", sans-serif; fill: #0f172a; }',
        '.title { font-size: 38px; font-weight: 700; }',
        '.subtitle { font-size: 22px; fill: #334155; }',
        '.label { font-size: 32px; font-weight: 700; }',
        '.small { font-size: 22px; fill: #475569; }',
        '.axis { font-size: 28px; fill: #475569; }',
        '.legend { font-size: 40px; fill: #475569; }',
        '.value { font-size: 18px; fill: #0f172a; }',
        '.warn { font-size: 28px; font-weight: 700; fill: #7f1d1d; }',
        '</style>',
    ]


def add_warning_box(parts, x, y, w, h):
    parts.extend([
        f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="18" fill="#fff1f2" stroke="#ef4444" stroke-width="2"/>',
        f'<text x="{x+20}" y="{y+42}" class="label" fill="#991b1b">Important caveat for `pqcrystal`</text>',
        f'<text x="{x+20}" y="{y+88}" class="warn">Not formally verified. Built through GCC. Constant-time behavior depends on compiler behavior.</text>',
    ])


def add_legend(parts, x, y, include_pqcrystal: bool):
    items = [
        ("#0f766e", "formosa"),
        ("#1d4ed8", "libcrux"),
        ("#b45309", "mlkem-native"),
        ("#b91c1c", "pqcrystal"),
    ]
    if not include_pqcrystal:
        items = items[:-1]
    cols = 2
    col_w = 430
    row_h = 52
    for idx, (color, label) in enumerate(items):
        col = idx % cols
        row = idx // cols
        slot_x = x + col * col_w
        slot_y = y + row * row_h
        parts.append(f'<rect x="{slot_x}" y="{slot_y-26}" width="32" height="32" rx="5" fill="{color}"/>')
        parts.append(f'<text x="{slot_x+46}" y="{slot_y+6}" class="legend">{esc(label)}</text>')


def add_pqc_overlay(parts, bar_x, bar_y, width, bar_h, accent):
    for off in range(0, width + 18, 18):
        parts.append(
            f'<line x1="{bar_x+off}" y1="{bar_y+bar_h}" x2="{bar_x+off+18}" y2="{bar_y}" stroke="{accent}" stroke-width="3" opacity="0.75"/>'
        )


def write_variant_svg(rows, variant, out_path: Path):
    subset = [r for r in rows if variant_of(r["impl"]) == variant]
    _write_variant_svg(subset, variant, out_path, include_warning=True, include_pqcrystal=True, legend_x=380, legend_y=1000, canvas_height=1140)


def write_variant_svg_without_pqcrystal(rows, variant, out_path: Path):
    subset = [r for r in rows if variant_of(r["impl"]) == variant and not r["impl"].startswith("pqc.")]
    _write_variant_svg(subset, variant, out_path, include_warning=False, include_pqcrystal=False, legend_x=460, legend_y=920, canvas_height=1020)


def _write_variant_svg(subset, variant, out_path: Path, include_warning: bool, include_pqcrystal: bool, legend_x: int, legend_y: int, canvas_height: int):
    width, height = 1520, canvas_height
    left = 140
    top = 300 if include_warning else 220
    chart_h = 640
    chart_w = 1340
    cluster_gap = 64
    group_gap = 38
    bar_w = 22
    maxv = max(r[op] for r in subset for op, _ in OPS)

    parts = svg_header(width, height)
    parts.extend([
        f'<text x="70" y="70" class="title">ML-KEM {variant} Deterministic Operation Breakdown</text>',
    ])
    if include_warning:
        add_warning_box(parts, 70, 90, 1380, 108)

    # chart area
    parts.append(f'<line x1="{left}" y1="{top+chart_h}" x2="{left+chart_w}" y2="{top+chart_h}" stroke="#94a3b8" stroke-width="1.5"/>')
    parts.append(f'<line x1="{left}" y1="{top}" x2="{left}" y2="{top+chart_h}" stroke="#94a3b8" stroke-width="1.5"/>')

    tick_count = 5
    for i in range(tick_count + 1):
        value = int(maxv * (tick_count - i) / tick_count)
        y = top + (chart_h * i / tick_count)
        parts.append(f'<line x1="{left}" y1="{y}" x2="{left+chart_w}" y2="{y}" stroke="#e2e8f0" stroke-width="1"/>')
        parts.append(f'<text x="{left-12}" y="{y+4}" text-anchor="end" class="axis">{value:,}</text>')

    cluster_w = (chart_w - cluster_gap * (len(OPS) - 1)) / len(OPS)
    for op_idx, (op, label) in enumerate(OPS):
        ranked = sorted(subset, key=lambda r: r[op])
        cluster_x = left + op_idx * (cluster_w + cluster_gap)
        group_total_w = len(ranked) * bar_w + (len(ranked) - 1) * group_gap
        start_x = cluster_x + (cluster_w - group_total_w) / 2
        parts.append(f'<text x="{cluster_x + cluster_w/2}" y="{top-18}" text-anchor="middle" class="label">{esc(label)}</text>')

        for idx, entry in enumerate(ranked):
            impl = entry["impl"]
            fill, accent = colors(impl)
            value = entry[op]
            bar_x = start_x + idx * (bar_w + group_gap)
            bar_height = chart_h * value / maxv
            bar_y = top + chart_h - bar_height
            parts.append(f'<rect x="{bar_x}" y="{bar_y}" width="{bar_w}" height="{bar_height}" rx="6" fill="{fill}"/>')
            if impl.startswith("pqc."):
                for off in range(0, int(bar_height) + 12, 12):
                    y1 = bar_y + bar_height - off
                    y2 = max(bar_y, y1 - 12)
                    parts.append(
                        f'<line x1="{bar_x}" y1="{y1}" x2="{bar_x+bar_w}" y2="{y2}" stroke="{accent}" stroke-width="2" opacity="0.75"/>'
                    )

    add_legend(parts, legend_x, legend_y, include_pqcrystal)
    parts.append("</svg>")
    out_path.write_text("\n".join(parts), encoding="utf-8")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output_dir", type=Path)
    args = parser.parse_args()

    rows = parse_table(args.input)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    write_variant_svg(rows, "768", args.output_dir / "derand-768.svg")
    write_variant_svg(rows, "1024", args.output_dir / "derand-1024.svg")
    write_variant_svg_without_pqcrystal(rows, "768", args.output_dir / "derand-768-no-pqcrystal.svg")
    write_variant_svg_without_pqcrystal(rows, "1024", args.output_dir / "derand-1024-no-pqcrystal.svg")


if __name__ == "__main__":
    main()
