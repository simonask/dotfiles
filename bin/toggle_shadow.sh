#!/usr/bin/env bash

ACTIVE=$(xprop -notype -root _NET_ACTIVE_WINDOW)
STATUS=$(xprop -notype -id ${ACTIVE##*\ } _COMPTON_SHADOW)
if [ "$STATUS" = "_COMPTON_SHADOW = 1" ]; then
    echo "removing shadow from window ${ACTIVE##*\ }"
    xprop -id ${ACTIVE##*\ } -remove _COMPTON_SHADOW
else
    echo "adding shadow to window ${ACTIVE##*\ }"
    xprop -id ${ACTIVE##*\ } -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 1
fi
