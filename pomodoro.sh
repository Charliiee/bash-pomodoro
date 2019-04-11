#!/bin/bash

# Don't run this in the same machine twice!
if pidof -o %PPID -x $(basename "$0") > /dev/null; then
    echo "Process already running" >&2
    exit 1
fi

SOURCEDIR="$(cd "$(dirname "${0}")"; echo "$(pwd)")"
pomodoro_icon="pomodoro-icon.png"
pomodoro_work="pomodoro-work.png"
pomodoro_work2="pomodoro-work.ico"
pomodoro_sound="to-the-point.ogg"

start_pomodoro() {
    # 25 minute work
    sleep 1500 && notify-send -t 600000 -i $SOURCEDIR/$pomodoro_icon "It's time to take a break!" "$1

$(date +%H:%M:%S)"

    paplay $SOURCEDIR/$pomodoro_sound
}

short_break() {
    # a short, 5 minute break
    sleep 300 && notify-send -t 600000 -i $SOURCEDIR/$pomodoro_work "Back to work!" "

    $(date +%H:%M:%S)"

    paplay $SOURCEDIR/$pomodoro_sound
}

long_break() {
    # a short, 15 minute break
    sleep 900 && notify-send -t 600000 -i $SOURCEDIR/$pomodoro_work2 "Back to work!" "

    $(date +%H:%M:%S)"

    paplay $SOURCEDIR/$pomodoro_sound
}

while true; do
    # First pomodoro
    start_pomodoro "(A short, 5 min, one)"; short_break;
    # Second pomodoro
    start_pomodoro "(A short, 5 min, one)"; short_break;
    # Third pomodoro
    start_pomodoro "(A short, 5 min, one)"; short_break;
    # Fourth pomodoro, take a longer break
    start_pomodoro "(Take a longer, 15 min, one now)"; long_break;
done
