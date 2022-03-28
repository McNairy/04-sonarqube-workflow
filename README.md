# 04-sonarqube-workflow
Argo Workflow for scanning with sonarqube

```
docker run \
  -e SONAR_HOST_URL="http://${SONARQUBE_URL}" \
  -e SONAR_LOGIN="${SONARQUBE_AUTH_TOKEN}" \
  -v "REPO:/usr/src" \
  sonarsource/sonar-scanner-cli:4.7.0 \
  -Dsonar.projectKey=example-1 \
  -Dsonar.language=java \
  -Dsonar.java.binaries=**/target/classes
```