#!/bin/bash
#
# Blueprint for bash scripts that take arguments from the command line

################################################################################
# Displays help message to commandline
# Arguments:
#   None
# Returns:
#   Exit code 1    as its called when somethign went wrong.
################################################################################
usage() {
    echo "Usage: $programname [-hipm] ... INFILE... OUTFILE"
    echo "Do a thing with INFILE(s) and safe result to OUTFILE"
    echo ""
    echo "These options are recognized by this script:"
    echo "  -h              display this help message"
    echo "  -i              echo user input"
    echo "  -p              display: ping"
    echo "  -m message      display specified message"
    exit 1
}

################################################################################
# getopts utility:
#   for help use: man getopts
#   usage:
#     specify flags with letters, and expected arguments with a colon in order
#     of appearance in a while loop.
#     use a case statement to specify actions.
#     Use $OPTARG to access arguments folowing flag
#
# shift $((OPTIND-1)):
#   remove arguments parsed by getopts from parameter list.
#
# arithmetic operators:
#   Use [ <test_condition> ] for flow control.
#   for more help use; man test
#
# <func>() {
# ...
# }        - specify a function
# <func>   - call function
# $<var>   - access variable
# $@       - all arguments parameter list.
# $#       - size of parameter list.
# $1       - arguments from parameter list by index.
# ${@: -1} - last argument from parameter list.
#
################################################################################
while getopts "hipm:" opt; do
  case $opt in
    i)
      echo "Type something you want echoed. Press Ctrl+D to end echo mode"
      while read; do echo "$REPLY"; done   # read stores in REPLY by default
      ;;
    p)  echo "ping"
      ;;
    m)
      echo "$OPTARG"
      ;;
    h|*)
      usage
      ;;
    esac
done

shift $((OPTIND-1))

if [ "$#" -lt 2 ]; then
  echo "At least one INFILE and one OUTFILE required"
  usage
  exit 1
fi

for i in $@; do
  if [ -f $i ]; then
    echo $i "is a file."
  elif [ -d $i ]; then
    echo $i "is a directory."
  else
    echo $i "is neither a file nor a directory."
  fi
done

OUTFILE=${@: -1}
echo "OUTFILE: $OUTFILE"
for var in "$@"; do
  if [ $var != $OUTFILE ]; then
    echo "INFILE: $var"
  fi
done
