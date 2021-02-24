#!/usr/bin/env python3

# Sgorblex's i3 config
# ~/.config/i3/scripts/scratchpad_show.py

#  usage: python scratchpad_show.py window_class xPercentage yPercentage
#  where xPercentage and yPercentage are relative to the monitor resolution

import i3ipc
import sys


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





#  i3 = i3ipc.Connection("/run/user/1000/i3/ipc-socket.XXXX")
i3 = i3ipc.Connection()

wclass = sys.argv[1]
if wclass == active_window().window_class:
    i3.command('[class="' + wclass + '"] scratchpad show')
else:
    output = active_output()
    w = output.rect.width
    h = output.rect.height

    xperc = int(sys.argv[2])
    yperc = int(sys.argv[3])
    x = w/100*xperc
    y = h/100*yperc

    i3.command('[class="' + wclass + '"] resize set ' +
               str(int(x)) + " " + str(int(y)) + ", scratchpad show, move position center")
