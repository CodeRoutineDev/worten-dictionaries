#!/bin/bash

# For correct results, make sure that the unmunched words file is encoded with UTF-8.
UNMUNCHED_WORDS_FILE="$1"

CHARS="ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"

# íÍéÉáÁóÓúÚ are transformed to their uppercase, non-accented versions.

cat "$UNMUNCHED_WORDS_FILE" |
    tr '[:lower:]' '[:upper:]' |
    sed -e "s/[íÍ]/I/g" -e "s/[éÉ]/E/g" -e "s/[áÁ]/A/g" -e "s/[óÓ]/O/g" -e "s/[úÚ]/U/g" |
    awk 'length($0) > 2' |
    grep -e "^[$CHARS]\+$" |
    sort |
    uniq
