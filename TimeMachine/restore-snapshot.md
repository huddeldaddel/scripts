# How to restore a snapshot

This is hopefully not necessary that often - so it's not automated. Restoring a snapshot is as simple as:

sudo btrfs send <snapshot to restore> | sudo btrfs receive <target folder>