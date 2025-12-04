#!/bin/bash

user=$(whoami)

chafa[0]=$(chafa -f symbols --symbols braille --fg-only --size 40x40 /home/$user/bin/img/footer.png)
chafa[1]=$(chafa -f symbols --symbols braille --fg-only --size 40x40 /home/$user/bin/img/bokita4.png)

num=$[ $RANDOM % ${#chafa[@]} ]

echo "${chafa[num]}"

