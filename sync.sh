#!/bin/bash

# Navigate to the dotfiles directory
cd ~/dotfiles || exit

# 1. Pull the latest from GitHub to avoid conflicts
/usr/bin/git pull --rebase origin main

# 2. Add all current changes (the "stowed" links and files)
/usr/bin/git add .

# 3. Commit only if there are actual changes
if ! /usr/bin/git diff-index --quiet HEAD; then
    /usr/bin/git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M')"
    
    # 4. Push to GitHub
    /usr/bin/git push origin main
fi
