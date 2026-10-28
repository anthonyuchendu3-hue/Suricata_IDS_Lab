# Evidence Guide

The task requires screenshots of key terminal outputs, naming grep results, `ls -l`, and permission checks as examples. Screenshots must come from your own terminal session. Save them in `evidence/screenshots/` with the names below.

Make sure the prompt (showing the user and host) is visible in each screenshot.

| File name | What to capture | Part |
|-----------|-----------------|------|
| `01_user_created.png` | `id forensic01` and `getent passwd forensic01` | 1 |
| `02_logs_dir_ls.png` | `ls -l /home/forensic01/logs/` after creating `sys_events.log` | 1 |
| `03_grep_error.png` | `grep "ERROR" sys_events.log` output | 2 |
| `04_grep_root_user01.png` | `grep -E "root\|user01" sys_events.log` output | 2 |
| `05_error_report.png` | `cat error_report.txt` after saving | 2 |
| `06_head_tail.png` | `head -n 5` and `tail -n 5` output | 2 |
| `07_permissions_before.png` | `ls -l confidential.txt` after `chmod 600` | 3 |
| `08_permissions_after_chown.png` | `ls -l confidential.txt` after `sudo chown root` | 3 |
| `09_access_denied.png` | The failed `cat` and `echo >>` attempts as `forensic01` | 3 |
| `10_guest_users.png` | `id guest1` showing the sudo group | 4 |
| `11_guest2_deleted.png` | `getent passwd guest2` returning nothing and `ls /home` | 4 |

Optional: save the text output of a command to a file in `evidence/` too, for example `./scripts/part2_log_analysis.sh | tee evidence/part2_output.txt`.
