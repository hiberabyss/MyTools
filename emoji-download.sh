#!/bin/bash
# Author: Hongbo Liu <lhbf@qq.com>
# Date  : 2023-08-14 00:09:04

website="https://www.emojiall.com"

main() {
  local url="$1"
  local name="$2"

  mkdir -p $name

  for src in $(curl $url | htmlq -a 'src' 'img' | grep "/$name/" | sort | uniq); do
    wget "$website/$src" -P "$name"
  done

}

main "$@"
