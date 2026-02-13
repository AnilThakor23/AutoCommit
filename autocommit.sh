#!/bin/bash

# Initialize counter if it doesn't exist
if [ ! -f .counter ]; then
  echo 0 > .counter
fi

while true
do
  # Read current count and increment
  count=$(cat .counter)
  count=$((count + 1))
  echo $count > .counter

  # Force a "change" by adding the counter to a dummy file
  echo "Commit number: $count" > sync_log.txt

  # Git commands
  git add .
  git commit -m "$count committed"
  git push origin main

  echo "Successfully pushed commit #$count. Waiting 60 seconds..."
  
  # Wait for 1 minute
  sleep 60
done