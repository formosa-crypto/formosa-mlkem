#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <number of tests>" >&2
    exit 1
fi

TESTS="$1"

if ! [[ "$TESTS" =~ ^[0-9]+$ ]]; then
    echo "Error: argument must be a positive integer" >&2
    exit 1
fi

BIN_DIR="./tests/checksums/bin"

TARGETS_768=(
    "formosa-mlkem-768-ref"
    "formosa-mlkem-768-avx2"
    "native-mlkem-768"
)

TARGETS_1024=(
    "formosa-mlkem-1024-ref"
    "formosa-mlkem-1024-avx2"
    "native-mlkem-1024"
)

SUMMARY_FILE="${GITHUB_STEP_SUMMARY:-/dev/stdout}"

echo "## MLKEM Implementation Checksum Comparison" >> "$SUMMARY_FILE"
echo "" >> "$SUMMARY_FILE"
echo "| **Parameter set** | **Implementation** | **Result** |" >> "$SUMMARY_FILE"
echo "| :--- | :--- | :---: |" >> "$SUMMARY_FILE"

FAILURE_COUNT=0

check_group() {
    local PARAM_SET="$1"
    shift

    local EXPECTED_CHECKSUM=""
    local REFERENCE_TARGET=""
    local BASENAME
    local CHECKSUM_FILE
    local ACTUAL_CHECKSUM
    local STATUS

    for BASENAME in "$@"; do
        CHECKSUM_FILE="$BIN_DIR/${BASENAME}_${TESTS}.out"

        if [[ ! -f "$CHECKSUM_FILE" ]]; then
            echo "| **$PARAM_SET** | **$BASENAME** | ❓ missing |" >> "$SUMMARY_FILE"
            FAILURE_COUNT=$((FAILURE_COUNT + 1))
            continue
        fi

        ACTUAL_CHECKSUM="$(tail -n 1 "$CHECKSUM_FILE" | tr -d '\r\n')"

        if [[ -z "$EXPECTED_CHECKSUM" ]]; then
            EXPECTED_CHECKSUM="$ACTUAL_CHECKSUM"
            REFERENCE_TARGET="$BASENAME"
            STATUS="✅ (used as reference)"
        elif [[ "$ACTUAL_CHECKSUM" == "$EXPECTED_CHECKSUM" ]]; then
            STATUS="✅"
        else
            STATUS="❌ differs from $REFERENCE_TARGET"
            FAILURE_COUNT=$((FAILURE_COUNT + 1))
        fi

        echo "| **$PARAM_SET** | **$BASENAME** | $STATUS |" >> "$SUMMARY_FILE"
    done
}

check_group "ML-KEM-768" "${TARGETS_768[@]}"
check_group "ML-KEM-1024" "${TARGETS_1024[@]}"

echo "---"

if [[ "$FAILURE_COUNT" -gt 0 ]]; then
    echo "Summary: $FAILURE_COUNT implementation(s) failed checksum validation."
    exit 1
else
    echo "Summary: all implementations matched within their ML-KEM parameter set."
fi
