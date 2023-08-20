#!/usr/bin/env bash
# converts files in metadata to pdf using WikiVim and pandoc
# Author: felix

files="$(ls ./metadata)"

if [ -z "$1" ]; then
  echo "input name."
  exit
fi

for file in $files ; do
  file="./metadata/$file"
  if [ -f "$file" ]; then
    if [ "$(echo $file | cut -d '.' -f3)" = 'html' ]; then
      echo "$file"
      pandoc "$file" -o "$1.pdf" --css "./metadata/style.css"
      # mv "./metadata/$1.pdf" .
    fi
  fi
done
