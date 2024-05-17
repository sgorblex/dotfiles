#!/usr/bin/env python3
# Sgorblex's i3 config
# ~/.config/i3/scripts/scratchpad_show.py

#  usage: python scratchpad_show.py [--lazy command process_name] window_class xPercentage yPercentage
#  where xPercentage and yPercentage are relative to the monitor resolution

import argparse
import i3ipc
import psutil
import subprocess
import time


def active_ws():
    for ws in i3.get_workspaces():
        if ws.focused:
            return ws
    return 0


def active_output():
    activews = active_ws().name
    for output in i3.get_outputs():
        if output.current_workspace == activews:
            return output
    return 0


def active_window():
    for container in i3.get_tree():
        if container.focused:
            return container
    return 0


# i3 = i3ipc.Connection("/run/user/1000/i3/ipc-socket.XXXX")
i3 = i3ipc.Connection()


def scratchpad_show(wclass, xperc, yperc):
    if wclass == active_window().window_class:
        i3.command(f'[class="{wclass}" floating] scratchpad show')
    else:
        rect = active_output().rect

        x = rect.width * xperc // 100
        y = rect.height * yperc // 100

        i3.command(f'[class="{wclass}" floating] resize set {str(x)} {str(y)}, scratchpad show, move position center')


def pgrep(PROCESS_NAME):
    return PROCESS_NAME in [p.info["name"] for p in psutil.process_iter(["name"])]


def window_exists(wclass):
    return wclass in [w.window_class for w in i3.get_tree().leaves()]


def run(command):
    try:
        # run the command with shell=True to enable shell features
        process = subprocess.Popen(command, shell=True, stdin=None, stdout=None, stderr=None, close_fds=True)
        return process.pid
    except Exception as e:
        print(f"failed to start and disown command: {e}")
        return None


def lazy(COMMAND, WINDOW_CLASS):  # return value: do I need to run scratchpad_show again
    if window_exists(WINDOW_CLASS):
        return False

    print("window not found; running command")
    run(COMMAND)

    MAX_ATTEMPTS = 50

    attempts = 0
    while attempts < MAX_ATTEMPTS:
        if window_exists(WINDOW_CLASS):
            return True
        time.sleep(0.1)
        attempts += 1
    print("couldn't find newly opened window; aborting")
    return False


def main():
    parser = argparse.ArgumentParser(description="TODO description")

    parser.add_argument("WINDOW_CLASS", type=str, help="Window class of the target window")
    parser.add_argument("XPERC", type=int, help="Percentage of the screen on the x axis")
    parser.add_argument("YPERC", type=int, help="Percentage of the screen on the y axis")

    parser.add_argument("--lazy", type=str, help="Start command if window not found, then apply scratchpad_show")

    args = parser.parse_args()

    scratchpad_show(args.WINDOW_CLASS, args.XPERC, args.YPERC)

    if args.lazy:
        if lazy(args.lazy, args.WINDOW_CLASS):
            scratchpad_show(args.WINDOW_CLASS, args.XPERC, args.YPERC)


if __name__ == "__main__":
    main()
