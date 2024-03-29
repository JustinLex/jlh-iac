#!/bin/bash

# Load B2 key and encryption password
source /mnt/backup/passwords_rc

# https://github.com/gilbertchen/duplicacy/wiki/backup
# backup to local
duplicacy -background -log backup -threads 4 -storage local 2>&1 | tee "/mnt/backup/log/backup-$(date +"%Y-%m-%dZ%T")"

# copy to remote
# https://github.com/gilbertchen/duplicacy/wiki/copy
duplicacy -background -log copy -threads 10 -from local -to remote 2>&1 | tee "/mnt/backup/log/copy-$(date +"%Y-%m-%dZ%T")"

# Notes:

# encryption password is stored in local config
# https://github.com/gilbertchen/duplicacy/wiki/Managing-Passwords

# Use -background flag to suppress prompts
# Use -log flag and output redirection to log to file
# https://github.com/gilbertchen/duplicacy/wiki/Global-Options
