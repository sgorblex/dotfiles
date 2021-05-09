#!/bin/sh

if command -v tmuxinator &> /dev/null; then
	tmuxinator def
else
	$SHELL
fi
