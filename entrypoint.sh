#!/bin/bash -l

# active bash options:
#   - bash act as if it had been invoked as a login shell".
#     Login shells read certain initialization files from your home directory,
#     such as .bash_profile. (-l)
#   - stops the execution of the shell script whenever there are any errors from a command or pipeline (-e)
#   - option to treat unset variables as an error and exit immediately (-u)
#   - print each command before executing it (-x)
#   - sets the exit code of a pipeline to that of the rightmost command
#     to exit with a non-zero status, or to zero if all commands of the
#     pipeline exit successfully (-o pipefail)
set -euo pipefail

main() {

  local path
  local properties
  local result

  path="$1"
  properties="$2"

  echo "path to properties-file: $path"
  echo "property keys: $properties"

  for key in $properties; do
    # For lines that have the given property on the left-hand side, remove
    # the property name, the equals and any spaces to get the property value.
    result=$(sed -n "/^[[:space:]]*$key[[:space:]]*=[[:space:]]*/s/^[[:space:]]*$key[[:space:]]*=[[:space:]]*//p" "$path")

    echo "value of '$key': $result"
    # shellcheck disable=SC2001
    echo "::set-output name=$(echo "$key" | sed 's/[^A-Za-z0-9_]/-/g')::$result"
  done
}

main "$1" "$2"
