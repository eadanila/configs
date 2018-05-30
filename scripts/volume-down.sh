#!/bin/bash

amixer -M sset 'Master' $((`amixer sget 'Master' | egrep -o '[0-9]+%' | head -1 | sed 's/%//'` - 1))%
polybar-msg hook cust-volume 1

