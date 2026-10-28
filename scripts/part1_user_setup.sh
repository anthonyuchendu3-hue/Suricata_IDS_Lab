#!/usr/bin/env bash
# Part 1, Steps 1-2: Create forensic01 (admin account runs this)
# Run as: sudo ./scripts/part1_user_setup.sh
set -euo pipefail

# Step 1: create user with home directory and /bin/bash shell
sudo useradd -m -s /bin/bash forensic01

# Add the user to the sudo group
sudo usermod -aG sudo forensic01

# Set a password for the user (interactive prompt; nothing is hard-coded)
sudo passwd forensic01

# Verify
id forensic01
getent passwd forensic01

# Step 2: switch to the new user (run this manually, it opens a new shell)
echo
echo "Next: log in as forensic01 with:"
echo "    su - forensic01"
