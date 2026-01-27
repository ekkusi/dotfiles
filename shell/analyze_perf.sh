#!/bin/bash

source ~/.config/shell/upm_aliases.sh

# Default values
COUNT=1
OUTFILE="gtime_results.txt"

# Parse options
while getopts "c:o:" opt; do
  case $opt in
    c)
      COUNT=$OPTARG
      ;;
    o)
      OUTFILE=$OPTARG
      ;;
    *)
      echo "Usage: $0 -c <count> -o <output_file> <command_to_run>"
      exit 1
      ;;
  esac
done

# Shift away parsed options so $@ contains only the command
shift $((OPTIND - 1))

# Check if command is provided
if [ $# -eq 0 ]; then
  echo "Error: No command provided."
  echo "Usage: $0 -c <count> -o <output_file> <command_to_run>"
  exit 1
fi
# Clear the output file
> "$OUTFILE"

for i in $(seq 1 $COUNT); do
  echo "Run #$i" >> "$OUTFILE"
  echo "" >> "$OUTFILE"

  nuke_nx
  
  # Run the provided command and capture only gtime output
  { gtime -v "$@"; } 2>> "$OUTFILE"
  
  echo "" >> "$OUTFILE"
done

