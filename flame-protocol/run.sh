#!/usr/bin/env bash

# CONFIG
ENGINE="mascot"
NUM_PARTIES=2
SCRIPT_DIR="./Source"

# INPUT
SCRIPT_NAME=$1

if [ -z "$SCRIPT_NAME" ]; then
  echo "Usage: ./run.sh <script-name> [num-parties]"
  exit 1
fi

if [ ! -f "$SCRIPT_DIR/$SCRIPT_NAME.mpc" ]; then
  echo "Error: $SCRIPT_DIR/$SCRIPT_NAME.mpc not found."
  exit 1
fi

if [ ! -z "$2" ]; then
  NUM_PARTIES=$2
fi

# RUN
../mp-spdz/Scripts/compile-run.py -E $ENGINE $SCRIPT_DIR/$SCRIPT_NAME.mpc