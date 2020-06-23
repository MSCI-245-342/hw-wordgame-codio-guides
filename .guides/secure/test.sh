#!/bin/bash
set -e
# Your actual test logic 
# Our demo function is just generating some random score
POINTS=$(( ( RANDOM % 100 )  + 1 ))
# Show json based passed environment
echo $CODIO_AUTOGRADE_ENV
# Send the grade back to Codio
curl --retry 3 -s "$CODIO_AUTOGRADE_URL&grade=$POINTS"
