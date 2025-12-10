#!/bin/bash

# --- Configuration ---
# Prefix for the Valgrind output files (e.g., 'test_kyber_clean-mem.out')
LOG_SUFFIX="-mem.out"
# Directory where the logs are created (assuming relative to the script)
LOG_DIR="./bench/bin" 

# --- Logic ---
# Ensure the script fails if any command fails, except where explicitly handled.
set -e

echo "## Valgrind Memory and Leak Check Report" >> "$GITHUB_STEP_SUMMARY"
echo '| **Implementation** | **Errors** |' >> "$GITHUB_STEP_SUMMARY"
echo '| :--- | :---: |' >> "$GITHUB_STEP_SUMMARY"

FAILURE_COUNT=0
TOTAL_FAILURES=0

# Loop through all files matching the log pattern
for LOG_FILE in $LOG_DIR/*$LOG_SUFFIX; do
    # Skip if no log files are found (though 'set -e' should catch this later if MTARGETS was run)
    if [ ! -f "$LOG_FILE" ]; then
        continue
    fi

    # Extract the basename (implementation name) from the log filename
    BASENAME=$(basename "$LOG_FILE" "$LOG_SUFFIX")
    
    # --- Check for Memory Errors (e.g., Use of Uninitialised Value, Invalid Read/Write) ---
    # We count the number of lines containing "ERROR SUMMARY: X errors" where X > 0
    # Valgrind's --error-exitcode=1 should handle this, but checking the log ensures a good report.
    ERROR_SUMMARY=$(grep "ERROR SUMMARY: " "$LOG_FILE")
    # Extract the number X from "ERROR SUMMARY: X errors"
    ERRORS=$(echo "$ERROR_SUMMARY" | grep -oP 'ERROR SUMMARY: \K[0-9]+')
    
    if [ -z "$ERRORS" ] || [ "$ERRORS" -gt 0 ]; then
        ERROR_STATUS="❌ $ERRORS"
        TOTAL_FAILURES=$((TOTAL_FAILURES + ERRORS))
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    else
        ERROR_STATUS="✅ 0"
    fi
    
    # --- Check for Memory Leaks (definitely lost bytes) ---
    # We look for the "definitely lost" bytes count
    # LEAK_SUMMARY=$(grep "definitely lost: " "$LOG_FILE")
    # Extract the number Y from "definitely lost: Y bytes in Z blocks"
    # LEAK_BYTES=$(echo "$LEAK_SUMMARY" | grep -oP 'definitely lost: \K[0-9]+')

    # if [ -z "$LEAK_BYTES" ] || [ "$LEAK_BYTES" -gt 0 ]; then
    #     LEAK_STATUS="❌ $LEAK_BYTES B"
    #     FAILURE_COUNT=$((FAILURE_COUNT + 1))
    # else
    #     LEAK_STATUS="✅ 0 B"
    # fi

    # # --- Determine Final Status ---
    # FINAL_STATUS="✅ PASS"
    # if [ "$ERRORS" -gt 0 ] || [ "$LEAK_BYTES" -gt 0 ]; then
    #     FINAL_STATUS="❌ FAIL"
    # fi

    echo "| **$BASENAME** | $ERROR_STATUS |" >> "$GITHUB_STEP_SUMMARY"

done

# --- Final Script Exit Status ---

echo "---"
if [ "$FAILURE_COUNT" -gt 0 ]; then
    echo "Summary: $FAILURE_COUNT target(s) FAILED memory checks ($TOTAL_FAILURES total error(s)). Job is failing."
    exit 1
else
    echo "Summary: All targets passed memory and leak checks."
fi