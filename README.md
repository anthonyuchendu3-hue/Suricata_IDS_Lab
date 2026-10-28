# Linux Forensics Lab: Users, Permissions & Log Analysis

A hands-on Linux command-line exercise covering user setup, log filtering, file permissions/ownership, and user management. This repository contains the commands, scripts, and documentation used to complete the lab, plus a place for terminal-output evidence.

## What the lab covers

| Part | Topic | Key commands |
|------|-------|--------------|
| 1 | New user setup (permissions & access control) | `useradd`, `usermod`, `passwd`, `su`, `mkdir`, `cat`, `echo` |
| 2 | Log filtering & analysis (text processing) | `grep`, `less`, `tee`/redirection, `head`, `tail`, `cat` |
| 3 | Permissions and ownership control | `chmod`, `chown`, `ls -l` |
| 4 | User management | `useradd`, `usermod`, `userdel` |

## Repository structure

```
linux-forensics-lab/
├── README.md                    <- this file
├── commands_used.txt            <- submission: exact commands, in order
├── scripts/
│   ├── part1_user_setup.sh      <- create forensic01, sudo group, password
│   ├── part1_create_logs.sh     <- logs/ directory + 24-line sys_events.log
│   ├── part2_log_analysis.sh    <- grep, pipe/redirect, head/tail, cat
│   ├── part3_permissions.sh     <- chmod, chown, access test
│   └── part4_user_management.sh <- guest1/guest2 create, modify, delete
├── docs/
│   ├── requirements-checklist.md <- every task requirement mapped to a command
│   ├── evidence-guide.md         <- which screenshots to take and how to name them
│   └── explanation.md            <- short written explanation (submission)
└── evidence/
    └── screenshots/              <- put your terminal screenshots here
```

## Prerequisites

- A Linux system (Ubuntu/Debian-style, since the lab uses the `sudo` group) where you have an account with `sudo` rights.
- Use a VM or lab machine, not a production system. The lab creates and deletes user accounts.

## How to run

You can either type the commands from `commands_used.txt` yourself (recommended, so you understand each step) or use the scripts.

```bash
git clone <your-repo-url>
cd linux-forensics-lab
chmod +x scripts/*.sh

# Part 1: as your admin account
./scripts/part1_user_setup.sh        # prompts you to set forensic01's password
su - forensic01                      # Step 2: log in as the new user

# Then, as forensic01 (copy the repo to a place forensic01 can read, e.g. /tmp)
./scripts/part1_create_logs.sh       # Step 3
./scripts/part2_log_analysis.sh      # Part 2
./scripts/part3_permissions.sh       # Part 3 (read/edit attempts are expected to fail)
./scripts/part4_user_management.sh   # Part 4
```

Notes:

- `su - forensic01` opens a new interactive shell, so Part 1 Step 2 is a manual step.
- `less` is interactive; press `q` to quit.
- The Part 3 "access denied" messages are the expected result, not a bug.
- Scripts default to `/home/forensic01/logs`. Set `LAB_DIR=/some/path` to do a dry run elsewhere.

## Submission checklist

The lab asks for three things:

- [ ] `commands_used.txt`: included at the repo root.
- [ ] Screenshots of key terminal outputs (grep results, `ls -l`, permission checks): see `docs/evidence-guide.md`, save into `evidence/screenshots/`.
- [ ] Short written explanation: draft in `docs/explanation.md`; fill in the observation section from your own run.

See `docs/requirements-checklist.md` for a line-by-line mapping of the task to commands.

## Reusing this as a template

The scripts take the working directory from `LAB_DIR`, and the docs separate requirements, evidence, and explanation, so the same layout works for other command-line labs: swap the scripts and update the checklist.
