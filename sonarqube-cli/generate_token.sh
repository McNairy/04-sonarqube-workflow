#!/bin/bash

LOGIN=$1
NAME=$2

echo "name: $NAME"
echo "login: $LOGIN"

curl -u $SONAR_USERNAME:$SONAR_PASSWORD \
  -X POST "http://localhost:9000/api/user_tokens/generate?login=$LOGIN&name=$NAME"
