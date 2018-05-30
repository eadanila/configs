#!/bin/bash

echo Vol: `amixer sget 'Master' | egrep -o '[0-9]+%' | head -1`

