#!/bin/bash

disp=`bspc query -M --names -m`
bspc node -d "$disp-$1"

