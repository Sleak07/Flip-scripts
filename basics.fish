#!/usr/bin/env fish
echo hello world

#Variables in fish and substitution
echo "My current directory is $PWD"
 echo 'My home is $HOME' # Variables substitution is done by double quotes not single

#Variables in fish
set name 'Mister noodle'
echo $name

#To execute two commands separate it by ;
echo Lol; echo this is fun

#&& for two commands that depend on each other
set var lol && echo $var
set var lol &&    # press Enter here
      echo $var
