#!/bin/bash

# Load B2 key and encryption password
source /mnt/backup/passwords_rc

# init local
# https://github.com/gilbertchen/duplicacy/wiki/init
duplicacy init -background -log -encrypt -storage-name local solid /mnt/backup/duplicacy > "/mnt/backup/logs/init-$(date +"%Y-%m-%dZ%T")" 2>&1

# add remote
# https://github.com/gilbertchen/duplicacy/wiki/add
duplicacy add -background -log -encrypt -storage-name remote solid b2://jlh-ditto > "/mnt/backup/logs/add-$(date +"%Y-%m-%dZ%T")" 2>&1


# Notes:
# encryption password is stored in passwords_rc
# https://github.com/gilbertchen/duplicacy/wiki/Managing-Passwords

# Use -background flag to suppress prompts
# Use -log flag and output redirection to log to file
# https://github.com/gilbertchen/duplicacy/wiki/Global-Options