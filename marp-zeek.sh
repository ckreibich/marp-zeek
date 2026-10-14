#! /usr/bin/env bash
#
# Wrapper to invoke Marp with our engine and stylesheet.

# Resolve symlinks to get the directory where the remaining files sit:
source="${BASH_SOURCE[0]}"
while [ -h "$source" ]; do
  dir="$(cd -P "$(dirname "$source")" >/dev/null 2>&1 && pwd)"
  target="$(readlink "$source")"
  if [[ $target != /* ]]; then
    source="$dir/$target"
  else
    source="$target"
  fi
done

dir="$(cd -P "$(dirname "$source")" >/dev/null 2>&1 && pwd)"

marp --engine $dir/marp/engine.js --theme $dir/zeek.css "$@"
