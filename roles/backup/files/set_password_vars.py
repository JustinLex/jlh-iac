#!/usr/bin/python
from pathlib import Path

import typing


# Saves the passwords for suplicacy as environment variables in a source file for Bash scripts

FILE_PATH = Path('/mnt/backup/passwords_rc')
BACKUP_FILE_PATH = Path('/mnt/backup/passwords_rc.backup')


def read_and_store_variable(envfile: typing.TextIO, variable_name: str) -> None:
    value = input(f"Enter the value for {variable_name}")
    envfile.write(f'{variable_name}="{value}"\n')


def main():
    # Move current variables to .backup"""
    FILE_PATH.replace(BACKUP_FILE_PATH)

    # list of variables that we need to track
    variables = [
        'DUPLICACY_PASSWORD',
        'DUPLICACY_B2_ID',
        'DUPLICACY_B2_KEY'
    ]

    # Create new file
    with open(FILE_PATH, 'w') as envfile:
        envfile.write('#!/usr/bin/env bash\n')

        # loop over list with func
        for var in variables:
            read_and_store_variable(envfile=envfile, variable_name=var)

        # Trailing newline for style
        envfile.write('\n')


if __name__ == "__main__":
    main()
