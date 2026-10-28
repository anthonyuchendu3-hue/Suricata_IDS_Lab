#!/usr/bin/env bash
# Part 2: Log filtering and analysis (grep, piping/redirection, head/tail, cat)
# Run as forensic01 after part1_create_logs.sh
# LAB_DIR can be overridden for dry runs.
set -euo pipefail

LAB_DIR="${LAB_DIR:-/home/forensic01/logs}"
cd "$LAB_DIR"

echo "=== 2.1 grep: all lines with ERROR ==="
grep "ERROR" sys_events.log

echo
echo "=== 2.1 grep: lines mentioning root or user01 ==="
grep -E "root|user01" sys_events.log

echo
echo "=== 2.2 Pipe to less and save to error_report.txt ==="
# tee writes the grep result to error_report.txt and passes it on to less.
# less is interactive in a terminal (press q to quit); when this script is
# run without a terminal, less simply prints the text.
grep "ERROR" sys_events.log | tee error_report.txt | less
grep -E "root|user01" sys_events.log | tee -a error_report.txt | less
echo "Saved to error_report.txt ($(wc -l < error_report.txt) lines)"

echo
echo "=== 2.3 First 5 lines ==="
head -n 5 sys_events.log
echo
echo "=== 2.3 Last 5 lines ==="
tail -n 5 sys_events.log

echo
echo "=== 2.4 Full log with cat ==="
cat sys_events.log
