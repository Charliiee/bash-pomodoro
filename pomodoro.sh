#!/bin/bash

SOURCEDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"
pomodoro_icon="pomodoro-icon.png"
pomodoro_work="pomodoro-work.png"  # Change this to .ico for a second option
pomodoro_sound="to-the-point.ogg"

start_pomodoro() {
    # 25 minute work
    sleep 1500 && notify-send -u critical -i $SOURCEDIR/$pomodoro_icon "It's time to take a break!"
    paplay $SOURCEDIR/$pomodoro_sound
}

short_break() {
    # a short, 5 minute break
    sleep 300 && notify-send -u critical -i $SOURCEDIR/$pomodoro_work "Back to work!"
    paplay $SOURCEDIR/$pomodoro_sound
}

long_break() {
    # a short, 15 minute break
    sleep 900 && notify-send -u critical -i $SOURCEDIR/$pomodoro_work "Back to work!"
    paplay $SOURCEDIR/$pomodoro_sound
}

# First pomodoro
start_pomodoro; short_break;
# Second pomodoro
start_pomodoro; short_break;
# Third pomodoro
start_pomodoro; short_break;
# Fourth pomodoro, take a longer break
start_pomodoro; long_break;

$SOURCEDIR/$0
