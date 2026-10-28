# Short Explanation

## What the commands do

### `grep`
`grep` searches text files for lines that match a pattern and prints those lines. With `-E` it accepts extended regular expressions, so `grep -E "root|user01"` matches lines containing either word. It is the main tool here for pulling relevant events out of a log.

### `chown`
`chown` changes the owner (and optionally the group) of a file or directory. Changing ownership to another user normally requires root privileges, which is why `sudo` is used. Ownership decides which permission set (owner, group, others) applies to whoever accesses the file.

### `usermod`
`usermod` modifies an existing user account. With `-aG sudo` it appends the user to the `sudo` group without removing existing group memberships (omitting `-a` would replace them). Group membership changes take effect at the user's next login.

## What I learned from accessing `confidential.txt` after changing its ownership

> Fill this in from your own run, using your screenshot `09_access_denied.png`.

What to expect and describe: the file is set to `600` (rw for owner only) and then owned by `root`. As `forensic01` you are now "others", and others have no access, so both `cat confidential.txt` and `echo "test entry" >> confidential.txt` should fail with "Permission denied".

Points you can include, if they match what you saw:

- Permissions only matter relative to who owns the file. The same `600` mode that protected the file for `forensic01` now locks `forensic01` out.
- Being in the `sudo` group does not bypass file permissions by itself; you need to actually run the command with `sudo` (for example `sudo cat confidential.txt`).
- `forensic01` still owns the `logs/` directory, so the filename can still be listed and the file could be removed or replaced even though its contents cannot be read. File access and directory permissions are separate.
