#!/bin/bash

status=$(fcitx5-remote)

if [ $status -eq 2 ]; then
  echo "Mozc (JP)"
elif [ $status -eq 1 ]; then
  echo "English (US)"
else
  echo "N/A"
fi
