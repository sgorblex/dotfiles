#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/nocolor.sh
# Removes ANSI color escape codes from a string. Pipe a program output into nocolor.sh to remove output colors, e.g. neofetch | nocolor.sh.

sed 's/\(\x9B\|\x1B\[\)[0-?]*[ -\/]*[@-~]//g'
