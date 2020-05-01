#!/bin/bash

xrdb -query | grep $1 | head -1 | cut -f 2
