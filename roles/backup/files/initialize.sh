#!/bin/bash


# init local
# https://github.com/gilbertchen/duplicacy/wiki/init
duplicacy init -background -encrypt local /mnt/backup/duplicacy > "/mnt/backup/logs/init-$(date +"%Y-%m-%dZ%T")"

# add remote
# https://github.com/gilbertchen/duplicacy/wiki/add
duplicacy add -background -encrypt remote


# encryption password is stored in local config
# https://github.com/gilbertchen/duplicacy/wiki/Managing-Passwords

# Use -background flag to suppress prompts
# Use -log flag and output redirection to log to file
# https://github.com/gilbertchen/duplicacy/wiki/Global-Options