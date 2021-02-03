#!/bin/bash
export COLOR="\x1b[38;2;0;205;0mtRUECOLOR\x1b[0m\n"

chars="abcdefghijklmnopqrstuvwxyzæøå“‘…¬˚π1234567890@-=ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ"
#for i in {1..8} ; do
for (( ; ; ))
do
    printf "\x1b[38;2;0;205;0m${chars:RANDOM%${#chars}:1}\x1b[0m"
done
