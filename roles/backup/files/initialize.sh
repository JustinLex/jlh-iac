#!/bin/bash

# Load B2 key and encryption password
source /mnt/backup/passwords_rc

# init local
# https://github.com/gilbertchen/duplicacy/wiki/init
duplicacy -background -log init -encrypt -repository /mnt/solid -storage-name local solid /mnt/backup/duplicacy > "/mnt/backup/log/init-$(date +"%Y-%m-%dZ%T")" 2>&1

# add remote
# https://github.com/gilbertchen/duplicacy/wiki/add
duplicacy -background -log add -encrypt -copy local -bit-identical -repository /mnt/solid remote solid b2://jlh-ditto > "/mnt/backup/log/add-$(date +"%Y-%m-%dZ%T")" 2>&1


# Notes:
# encryption password is stored in passwords_rc
# https://github.com/gilbertchen/duplicacy/wiki/Managing-Passwords

# Use -background flag to suppress prompts
# Use -log flag and output redirection to log to file
# https://github.com/gilbertchen/duplicacy/wiki/Global-Options
