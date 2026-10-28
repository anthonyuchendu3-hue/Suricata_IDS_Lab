# Requirements Checklist

Every requirement below comes from the uploaded task (Task_003.pdf). Nothing has been added.

## Part 1: New User Setup (Permissions & Access Control)

| # | Requirement | Command / file | Script |
|---|-------------|----------------|--------|
| 1a | Create user `forensic01` with home directory and `/bin/bash` shell | `sudo useradd -m -s /bin/bash forensic01` | part1_user_setup.sh |
| 1b | Add user to `sudo` group | `sudo usermod -aG sudo forensic01` | part1_user_setup.sh |
| 1c | Set a password | `sudo passwd forensic01` | part1_user_setup.sh |
| 2 | Log in as `forensic01` | `su - forensic01` | manual |
| 3a | Create `/home/forensic01/logs/` | `mkdir -p /home/forensic01/logs/` | part1_create_logs.sh |
| 3b | Create `sys_events.log` using `cat` and `echo`, 20+ lines, including ERROR, WARNING, INFO, user01, root, timestamps | `echo ... >`, `echo ... >>`, `cat >> ... << 'EOF'` (24 lines) | part1_create_logs.sh |

## Part 2: Log Filtering & Analysis

| # | Requirement | Command | Script |
|---|-------------|---------|--------|
| 1a | List all lines with `ERROR` | `grep "ERROR" sys_events.log` | part2_log_analysis.sh |
| 1b | Lines mentioning `root` or `user01` | `grep -E "root\|user01" sys_events.log` | part2_log_analysis.sh |
| 2a | Pipe grep results to `less` | `grep ... \| tee error_report.txt \| less` | part2_log_analysis.sh |
| 2b | Save output to `error_report.txt` | `tee error_report.txt` (second grep uses `tee -a`) | part2_log_analysis.sh |
| 3 | First 5 and last 5 lines | `head -n 5`, `tail -n 5` | part2_log_analysis.sh |
| 4 | View entire log with `cat` | `cat sys_events.log` | part2_log_analysis.sh |

Interpretation note: the task says "save the output to error_report.txt" without saying which of the two grep results. Both are saved (ERROR lines first, then root/user01 lines appended).

## Part 3: Permissions and Ownership Control

| # | Requirement | Command | Script |
|---|-------------|---------|--------|
| 1a | Create `confidential.txt` in `logs/` | `touch confidential.txt` | part3_permissions.sh |
| 1b | rw for owner, no access for group and others | `chmod 600 confidential.txt` | part3_permissions.sh |
| 2 | Use `sudo` to change owner to root | `sudo chown root confidential.txt` | part3_permissions.sh |
| 3 | Try to edit/read as `forensic01` and observe | `cat confidential.txt`; `echo "test entry" >> confidential.txt` | part3_permissions.sh |

## Part 4: User Management Commands

| # | Requirement | Command | Script |
|---|-------------|---------|--------|
| 1 | Create `guest1` and `guest2` | `sudo useradd -m guest1` / `guest2` | part4_user_management.sh |
| 2 | Add `guest1` to `sudo` group | `sudo usermod -aG sudo guest1` | part4_user_management.sh |
| 3 | Remove `guest2` including home directory | `sudo userdel -r guest2` | part4_user_management.sh |

## Submission Requirements

| Requirement | Where |
|-------------|-------|
| Text file with exact commands (`commands_used.txt`) | `commands_used.txt` |
| Screenshots of key outputs (grep results, `ls -l`, permission checks) | `evidence/screenshots/` (see `evidence-guide.md`) |
| 2-3 line explanation each of `grep`, `chown`, `usermod` | `docs/explanation.md` |
| What was learned from accessing `confidential.txt` after the ownership change | `docs/explanation.md` (fill in from your own run) |
