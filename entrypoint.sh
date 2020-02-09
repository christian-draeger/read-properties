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
  local property
  local result

  path="$1"
  property="$2"

  echo "path to properties-file: $path"
  echo "property key: $property"

  # For lines that have the given property on the left-hand side, remove 
  # the property name, the equals and any spaces to get the property value.
  result=$(sed -n "/^[[:space:]]*$property[[:space:]]*=[[:space:]]*/s/^[[:space:]]*$property[[:space:]]*=[[:space:]]*//p" "$path")

  echo "property value: $result"
  echo ::set-output name=value::"$result"
}

main "$1" "$2"
