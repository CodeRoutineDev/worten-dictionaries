#!/bin/bash

# For correct results, make sure that the unmunched words file is encoded with UTF-8.
UNMUNCHED_WORDS_FILE="$1"

# The characters that are actually part of the german letter set in Worten.
# (i.e. all german characters except Q,X,Y,ẞ. "Umlaute" and ß are transformed to simplified versions first.)
CHARS="ABCDEFGHIJKLMNOPRSTUVWZ"

cat "$UNMUNCHED_WORDS_FILE" |
    tr '[:lower:]' '[:upper:]' |
    sed -e "s/[öÖ]/OE/g" -e "s/[äÄ]/AE/g" -e "s/[üÜ]/UE/g" -e "s/[ßẞ]/SS/g" |
    awk 'length($0) > 2' |
    grep -e "^[$CHARS]\+$" |
    sort |
    uniq
