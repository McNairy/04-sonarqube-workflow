docker run \
    --rm \
    -e SONAR_HOST_URL="http://${SONARQUBE_URL}" \
    -e SONAR_LOGIN="myAuthenticationToken" \
    -v "${YOUR_REPO}:/usr/src" \
    sonarsource/sonar-scanner-cli

docker run \
  -e SONAR_HOST_URL="http://${SONARQUBE_URL}" \
  -e SONAR_LOGIN="${SONARQUBE_AUTH_TOKEN}" \
  -v "REPO:/usr/src" \
  sonarsource/sonar-scanner-cli:4.7.0 \
  -Dsonar.projectKey=example-1 \
  -Dsonar.language=java \
  -Dsonar.java.binaries=**/target/classes

  curl -u $SONAR_USERNAME:$SONAR_PASSWORD \
  -X POST "http://localhost:9000/api/projects/create?project=$PROJECT&name=$NAME"
