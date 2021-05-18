#!/bin/env python3
#  Sgorblex's Polybar config
#  ~/.config/polybar/scripts/polybar-todoist.py
# Script for the todoist polybar module

import datetime
from json import loads as jsnld
from subprocess import run
from time import sleep

import todoist


class APIKeyNotFoundError(Exception):
    pass


def api_token_bitwarden():
    try:
        for field in jsnld(run(["bw", "--nointeraction", "--raw", "list", "items", "--search", "todoist"], capture_output=True, text=True).stdout)[0]["fields"]:
            if field["name"] == "API token":
                return field["value"]
    except:
        raise APIKeyNotFoundError
    raise APIKeyNotFoundError


def api_token():
    return run(['secret-tool', 'lookup', 'uuid', 'todoist_api_token'], capture_output=True, text=True).stdout


def filter_dueToday(item):
    if item['checked'] or not item['due']:
        return False

    duedate = datetime.datetime.strptime(
        item['due']['date'][0:10], '%Y-%m-%d').date()

    return duedate <= datetime.date.today()


def main():
    try:
        api = todoist.TodoistAPI(api_token())
    except:
        print('ERROR')
        exit(1)
    while True:
        try:
            api.sync()
            res = len(api.items.all(filt=filter_dueToday))
            print(res if res else " ")
        except:
            print("")
        sleep(5)


main()
