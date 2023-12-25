#!/bin/bash

# Find processes using port 8000 and extract PIDs
PIDS=$(lsof -ti :8000)

# Check if any processes were found
if [ -n "$PIDS" ]; then
    echo "Processes found on port 8000. Killing..."
    # Kill the processes found
    kill -9 $PIDS
    echo "Processes killed."
else
    echo "No processes found on port 8000."
fi
