#!/bin/bash

status=$(fcitx5-remote)

if [ $status -eq 2 ]; then
  echo "JP"
elif [ $status -eq 1 ]; then
  echo "EN"
else
  echo "N/A"
fi
