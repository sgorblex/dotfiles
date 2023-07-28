#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/trim.sh
# Trims leading and trailing whitespaces of stdin


sed -e 's/^\s\+//' -e 's/\s\+$//'
