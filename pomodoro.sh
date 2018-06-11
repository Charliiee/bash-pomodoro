#!/bin/bash

SOURCEDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"

start_pomodoro() {
    # 25 minute work
    sleep 1500 && notify-send -u critical -i $SOURCEDIR/pomodoro-icon.png "It's time to take a break!"
}

short_break() {
    # a short, 5 minute break
    sleep 300 && notify-send -u critical -i $SOURCEDIR/pomodoro-work.png "Back to work!"
}

long_break() {
    # a short, 15 minute break
    sleep 900 && notify-send -u critical -i $SOURCEDIR/pomodoro-work.png "Back to work!"
}

# First pomodoro
start_pomodoro; short_break;
# Second pomodoro
start_pomodoro; short_break;
# Third pomodoro
start_pomodoro; short_break;
# Fourth pomodoro, take a longer break
start_pomodoro; long_break;
