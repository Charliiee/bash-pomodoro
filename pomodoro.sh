#!/bin/bash

SOURCEDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"

start_pomodoro() {
    # 25 minute work
    sleep 1500 && notify-send -u critical -i $SOURCEDIR/pomodoro-icon.png "It's time to take a break!"
}

start_pomodoro;
