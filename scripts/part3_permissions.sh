#!/usr/bin/env bash
# Part 3: Permissions and ownership control
# Run as forensic01 (needs sudo for the chown step).
# LAB_DIR can be overridden for dry runs.
# Note: no "set -e" here, because the last step is EXPECTED to fail.

LAB_DIR="${LAB_DIR:-/home/forensic01/logs}"
cd "$LAB_DIR" || exit 1

echo "=== 3.1 Create confidential.txt and set permissions ==="
touch confidential.txt
chmod 600 confidential.txt        # rw for owner, nothing for group/others
ls -l confidential.txt

echo
echo "=== 3.2 Change owner to root ==="
sudo chown root confidential.txt
ls -l confidential.txt

echo
echo "=== 3.3 Try to read and edit as $(whoami) ==="
echo "--- read attempt (cat) ---"
cat confidential.txt
echo "exit status: $?"

echo "--- edit attempt (append with echo) ---"
echo "test entry" >> confidential.txt
echo "exit status: $?"
