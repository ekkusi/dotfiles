#!/bin/bash

run-docker-test() {
  local CPUS="1.0"
  local MEMORY="4g"
  local NODE_VERSION="20"
  local CMD=""

  # Parse flags
  while getopts "c:m:n:" opt; do
    case $opt in
      c) CPUS="$OPTARG" ;;
      m) MEMORY="$OPTARG" ;;
      n) NODE_VERSION="$OPTARG" ;;
      *) echo "Usage: run_docker_test [-c cpus] [-m memory] [-n node_version] <command>"
         return 1 ;;
    esac
  done

  shift $((OPTIND -1))

  # Remaining argument = command
  CMD="$*"

  if [ -z "$CMD" ]; then
    echo "❌ No command provided"
    echo "Usage: run_docker_test [-c cpus] [-m memory] [-n node_version] <command>"
    return 1
  fi

  docker run -it --rm \
    --cpus="$CPUS" \
    --memory="$MEMORY" \
    -v "$PWD:/app" \
    -v node_modules_cache:/app/node_modules \
    -w /app \
    node:"$NODE_VERSION" \
    bash -c "$CMD"
}
