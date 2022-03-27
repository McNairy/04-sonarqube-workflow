#!/bin/bash

NAME=$1
PROJECT=$2

echo "name: $NAME"
echo "project: $PROJECT"

## Doesn't work
# curl --include \
#      -X POST 'http://localhost:9000/api/projects/create' \
#      -H "Content-Type: application/json" \
#      -u $SONAR_USERNAME:$SONAR_PASSWORD \
#      -d '{"project":"myproject","name":"some-project"}'

curl -u $SONAR_USERNAME:$SONAR_PASSWORD \
  -X POST "http://localhost:9000/api/projects/create?project=$PROJECT&name=$NAME"
