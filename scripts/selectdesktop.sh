#!/bin/bash

disp=`bspc query -M --names -m`
bspc desktop -f "$disp-$1"

