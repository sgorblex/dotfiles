#!/bin/env python3
# Sgorblex's Polybar config
# ~/.config/polybar/scripts/polybar-todoist.py
# Script for the todoist polybar module

from datetime import date
from subprocess import run
from sys import argv

from todoist_api_python.api import TodoistAPI


def api_token():
    return run(['secret-tool', 'lookup', 'uuid', 'todoist_api_token'], capture_output=True, text=True).stdout


def main():
    debug = "--debug" in argv

    token = api_token()
    if not token:
        print("Can't find token" if debug else "Error")
        exit(1)
    api = TodoistAPI(token)
    try:
        tasks = api.get_tasks()
        filtered = [t for t in tasks if not t.is_completed and t.due and t.due.date <= date.today().strftime("%Y-%m-%d")]
        res = len(filtered)
        print(res if res else " ")
    except Exception as error:
        print(error if debug else "Error")
        exit(1)


main()
