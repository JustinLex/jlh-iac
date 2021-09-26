#!/bin/bash

# Load B2 key and encryption password
source /mnt/backup/passwords_rc

# https://github.com/gilbertchen/duplicacy/wiki/backup
# backup to local
duplicacy backup -background -log -threads 4 -storage local > "/mnt/backup/logs/backup-$(date +"%Y-%m-%dZ%T")" 2>&1

# copy to remote
# https://github.com/gilbertchen/duplicacy/wiki/copy
duplicacy copy -background -log -threads 10 -from local -to remote > "/mnt/backup/logs/copy-$(date +"%Y-%m-%dZ%T")" 2>&1

# Notes:

# encryption password is stored in local config
# https://github.com/gilbertchen/duplicacy/wiki/Managing-Passwords

# Use -background flag to suppress prompts
# Use -log flag and output redirection to log to file
# https://github.com/gilbertchen/duplicacy/wiki/Global-Options