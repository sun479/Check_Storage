#!/bin/sh

# Define the base log directory
LOG_DIR="/store/ariel/events/records"

# Ensure the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Find the earliest month and day in the folder structure
EARLIEST_MONTH=$(ls -1 "$LOG_DIR" | sort -n | head -n 1)
EARLIEST_DAY=$(ls -1 "$LOG_DIR/$EARLIEST_MONTH" | sort -n | head -n 1)

# Validate the found directories
if [ -z "$EARLIEST_MONTH" ] || [ -z "$EARLIEST_DAY" ]; then
    echo "Could not determine the earliest log date structure."
    exit 1
fi

# Get the first log file inside the earliest directory
OLDEST_FILE=$(find "$LOG_DIR/$EARLIEST_MONTH/$EARLIEST_DAY" -type f | sort | head -n 1)

if [ -z "$OLDEST_FILE" ]; then
    echo "No log files found in $LOG_DIR/$EARLIEST_MONTH/$EARLIEST_DAY"
    exit 1
fi

echo "Oldest log file found: $OLDEST_FILE"

# Extract the first timestamp from the file
FIRST_DATE=$(grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' "$OLDEST_FILE" | sort | head -n 1)

if [ -n "$FIRST_DATE" ]; then
    echo "Earliest log entry date: $FIRST_DATE"
else
    echo "Could not determine the first date from the logs."
fi
