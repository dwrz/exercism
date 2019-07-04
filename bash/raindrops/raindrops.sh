#!/usr/bin/env bash

main() {
  local name=""

  if [ $(($1 % 3)) -eq 0 ]; then
    name="Pling"
  fi

  if [ $(($1 % 5)) -eq 0 ]; then
    name="${name}Plang"
  fi

  if [ $(($1 % 7)) -eq 0 ]; then
    name="${name}Plong"
  fi

  if [ "$name" = "" ]; then
    name="$1"
  fi

  echo $name
}

main "$@"
