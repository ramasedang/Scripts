#!/bin/sh
# Copyright (C) 2021 @kry9ton (Telegram and Github)
# Author: Kry9toN(Dhimas) @Github
# Date : 26 May 2021

trap ctrl_c INT

function ctrl_c() {
    echo ""
    echo "Exit"
    exit 0
}

while :
do
    if curl github.com -m 5 &>/dev/null # Check internet from access github.com
    then
        # Logic if have internet
        echo "Ping Done - `date`"
        sleep 5
    else
        # Logic if no internet
        echo "Ping Fail - `date`"
        /etc/init.d/login
        sleep 1
        /etc/init.d/rekonek
        sleep 6
        /etc/init.d/network restart
        sleep 3
        /etc/init.d/shadowsocksr restart
        sleep 2
    fi
done
