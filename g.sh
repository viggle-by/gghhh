#!/bin/bash
# Backup your current pacman mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo "Backup of mirrorlist saved as mirrorlist.bak"

# Replace the mirrorlist with the archive repo
tee /etc/pacman.d/mirrorlist > /dev/null <<EOF
Server = https://archive.archlinux.org/repos/2023/09/01/\$repo/os/\$arch
EOF

echo "Mirrorlist updated to use Arch Linux Archive snapshot: 2023/09/01"

# Update pacman database
pacman -Syy
echo "Pacman database updated from archive snapshot"
