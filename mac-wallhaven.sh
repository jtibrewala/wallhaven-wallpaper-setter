#!/bin/bash

#This is a script that changes your wallpaper every X seconds to a random picture from wallhaven
#Originally inspired by https://github.com/tymscar/Unsplash-Random-Wallpaper-Setter
#Preference is for it to be set as a cron job in apple so that it runs every hour between 8am and 10pm

#while true; do

    arr[0]="https://wallhaven.cc/search?q=buddha&categories=111&purity=100&atleast=1920x1080&sorting=random&order=desc&seed=fzEn8"
    arr[1]="https://wallhaven.cc/search?q=avengers&categories=111&purity=100&atleast=1920x1080&sorting=random&order=desc&seed=fzEn8"
    rand=$[$RANDOM % ${#arr[@]}]
    randurl=${arr[$rand]}

    echo $(date)
    echo $randurl

    # Creating folder
    mkdir ./folder$RANDOM
    cd ./folder*/

    # Downloading picture
    # wget "https://wallhaven.cc/search?q=buddha&categories=111&purity=100&atleast=1920x1080&sorting=random&order=desc&seed=fzEn8" -O walp.html -q
    wget $randurl -O walp.html -q

    cat walp.html | grep -Eo 'https://wallhaven.cc/w/[0-9a-z]{1,6}' > walps.txt

    wget "$(cat walps.txt | head -"$(echo $((($RANDOM%$(cat walps.txt | wc -l))+1)))" | tail -1)" -O wallpaper.html -q

    wget $(cat wallpaper.html | grep -o "id=\"wallpaper\".*alt" | grep -o "src=\".*\"" | sed 's/src="//' | sed 's/"//') -O pic.jpg -q

    # Setting wallpaper in osx
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'$(pwd)'/pic.jpg"'

    # Removing unused folder
    cd ..
    rm -r folder*
    #sleep 600
#done
