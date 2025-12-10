#!/bin/bash

BIN_DIR="./bench/bin"
TARGETS_768=("test_jasmin_768_ref" "test_jasmin_768_avx2")
TARGETS_1024=("test_jasmin_1024_ref" "test_jasmin_1024_avx2")


set -e

SHA_FILE_768="$BIN_DIR/test_mlkem_native_768.sha"
if [ ! -f "$SHA_FILE_768" ]; then
    echo "ERROR: Expected SHA file not found: $SHA_FILE_768" >&2
    exit 1
fi
EXPECTED_SHA_768=$(tail -n 1 "$SHA_FILE_768" | tr -d '\r\n')


SHA_FILE_1024="$BIN_DIR/test_mlkem_native_1024.sha"
if [ ! -f "$SHA_FILE_1024" ]; then
    echo "ERROR: Expected SHA file not found: $SHA_FILE_1024" >&2
    exit 1
fi
EXPECTED_SHA_1024=$(tail -n 1 "$SHA_FILE_1024" | tr -d '\r\n')


echo "## MLKEM Implementation Checksum Comparison" >> "$GITHUB_STEP_SUMMARY"
echo '| **Implementation** | **Result** |' >> "$GITHUB_STEP_SUMMARY"
echo '| :--- | :---: |' >> "$GITHUB_STEP_SUMMARY"

FAILURE_COUNT=0


for BASENAME in "${TARGETS_768[@]}"; do
    SHA_FILE="$BIN_DIR/$BASENAME.sha"

    if [ -f "$SHA_FILE" ]; then
        ACTUAL_SHA=$(tail -n 1 "$SHA_FILE" | tr -d '\r\n')
    else
        echo "| **$BASENAME** | ❓ |" >> "$GITHUB_STEP_SUMMARY"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
        continue
    fi
    
    if [ "$ACTUAL_SHA" == "$EXPECTED_SHA_768" ]; then
        STATUS="✅"
    else
        STATUS="❌"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    fi
    echo "| **$BASENAME** | $STATUS |" >> "$GITHUB_STEP_SUMMARY"
done

for BASENAME in "${TARGETS_1024[@]}"; do
    SHA_FILE="$BIN_DIR/$BASENAME.sha"

    if [ -f "$SHA_FILE" ]; then
        ACTUAL_SHA=$(tail -n 1 "$SHA_FILE" | tr -d '\r\n')
    else
        echo "| **$BASENAME** | ❓ |" >> "$GITHUB_STEP_SUMMARY"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
        continue
    fi
    
    if [ "$ACTUAL_SHA" == "$EXPECTED_SHA_1024" ]; then
        STATUS="✅"
    else
        STATUS="❌"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    fi
    echo "| **$BASENAME** | $STATUS |" >> "$GITHUB_STEP_SUMMARY"
done

echo "---"
if [ "$FAILURE_COUNT" -gt 0 ]; then
    echo "Summary: $FAILURE_COUNT implementation(s) FAILED checksum validation. Job is failing."
    exit 1
else
    echo "Summary: All required Jasmin implementations matched the mlkem-native checksums."
fi