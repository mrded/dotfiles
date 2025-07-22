#!/bin/bash

# Check if port number is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

PORT=$1

# Find the PID using the port
PID=$(lsof -ti tcp:$PORT)

# Check if a process was found
if [ -z "$PID" ]; then
  echo "No process found on port $PORT"
  exit 0
fi

# Kill the process
echo "Killing process $PID using port $PORT..."
kill -9 $PID

# Confirm
echo "Process $PID killed."
