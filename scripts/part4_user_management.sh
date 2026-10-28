#!/usr/bin/env bash
# Part 4: User management commands
# Run as forensic01 (a sudo user), or as any admin account.
set -euo pipefail

echo "=== 4.1 Create temporary users guest1 and guest2 ==="
sudo useradd -m guest1
sudo useradd -m guest2
getent passwd guest1 guest2

echo
echo "=== 4.2 Add guest1 to the sudo group ==="
sudo usermod -aG sudo guest1
id guest1

echo
echo "=== 4.3 Delete guest2 including its home directory ==="
sudo userdel -r guest2

echo
echo "=== Verify guest2 is gone ==="
getent passwd guest2 || echo "guest2 no longer exists"
ls /home
