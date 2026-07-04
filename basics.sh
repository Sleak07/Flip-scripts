#!/bin/bash

#Variables in bash
name="Let's Learn Bash"
echo "$name"

#greeting
greeting="welcome"
user=$(whoami)
user=$(date +%A)

echo "$greeting back $user! Today is $day, which is the best day of the entire week!"
echo "Your Bash shell version is: $BASH_VERSION. Enjoy!"
