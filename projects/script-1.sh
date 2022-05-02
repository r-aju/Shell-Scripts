#!/bin/bash

echo " Welcome to secret agent application"
echo "-----------------------------------"

read -p "echo enter your name:" name
read -p "echo enter the name of the fav actor:" actor
read -p "echo enter your lucky number:" lucky
read -p "echo enter your favourite dish:" dish

first_char_name=$(echo -n $name | cut -c 1)

len=$(echo -n $actor | wc -c)
last_char_actor=$(echo -n $actor | cut -c $len)

no_of_char_dish=$(echo -n $dish | wc -c)


if [ $first_char_name = "d" -a $last_char_actor = "r" -a $lucky -eq 7 -a $no_of_char_dish -ge 6 ]; then
echo "hello welcome you are eligible"
else
echo "hello $name, you are not elibigle"
fi
