#!/usr/bin/env bash

name="you"

if [ "$#" -ge 1 ]; then
    name=$1
fi

echo "One for $name, one for me."
