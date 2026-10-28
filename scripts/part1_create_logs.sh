#!/usr/bin/env bash
# Part 1, Step 3: Create /home/forensic01/logs/ and sys_events.log
# Run as forensic01: ./scripts/part1_create_logs.sh
# LAB_DIR can be overridden for dry runs, e.g. LAB_DIR=/tmp/test ./part1_create_logs.sh
set -euo pipefail

LAB_DIR="${LAB_DIR:-/home/forensic01/logs}"

mkdir -p "$LAB_DIR"
cd "$LAB_DIR"

# First lines written with echo (> creates/overwrites, >> appends)
echo "2026-10-21 08:00:01 INFO  kernel: system boot completed" > sys_events.log
echo "2026-10-21 08:00:05 INFO  sshd: service started on port 22" >> sys_events.log
echo "2026-10-21 08:01:12 INFO  sshd: accepted password for user01 from 192.168.1.10" >> sys_events.log

# Remaining lines appended with cat and a here-document
cat >> sys_events.log << 'EOF'
2026-10-21 08:02:30 WARNING sudo: user01 attempted to run /usr/bin/apt without privileges
2026-10-21 08:03:44 ERROR  sshd: failed password for root from 203.0.113.45
2026-10-21 08:03:51 ERROR  sshd: failed password for root from 203.0.113.45
2026-10-21 08:05:10 INFO  cron: job daily-backup started
2026-10-21 08:06:02 WARNING disk: /var usage at 85%
2026-10-21 08:07:15 INFO  user01: opened /home/user01/report.docx
2026-10-21 08:08:40 ERROR  nginx: upstream timed out while connecting
2026-10-21 08:10:00 INFO  systemd: started session 12 for user01
2026-10-21 08:11:23 WARNING auth: multiple login attempts for root detected
2026-10-21 08:12:09 ERROR  mysql: connection refused on port 3306
2026-10-21 08:13:55 INFO  root: package index updated
2026-10-21 08:15:31 INFO  firewall: rule added to block 203.0.113.45
2026-10-21 08:16:48 ERROR  user01: permission denied reading /etc/shadow
2026-10-21 08:18:02 WARNING memory: swap usage at 70%
2026-10-21 08:19:20 INFO  cron: job daily-backup finished
2026-10-21 08:20:44 INFO  root: logrotate executed
2026-10-21 08:22:13 ERROR  disk: I/O error on /dev/sda1
2026-10-21 08:23:30 INFO  sshd: session closed for user01
2026-10-21 08:25:00 WARNING ntp: clock drift of 0.5s detected
2026-10-21 08:26:41 INFO  systemd: reached target multi-user
2026-10-21 08:30:00 INFO  kernel: audit log checkpoint saved
EOF

echo "Created $LAB_DIR/sys_events.log with $(wc -l < sys_events.log) lines"
ls -l "$LAB_DIR"
