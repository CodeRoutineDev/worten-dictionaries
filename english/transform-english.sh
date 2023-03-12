#!/bin/bash

# For correct results, make sure that the unmunched words file is encoded with UTF-8.
UNMUNCHED_WORDS_FILE="$1"

CHARS="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

cat "$UNMUNCHED_WORDS_FILE" |
    tr '[:lower:]' '[:upper:]' |
    awk 'length($0) > 2' |
    grep -e "^[$CHARS]\+$" |
    sort |
    uniq
