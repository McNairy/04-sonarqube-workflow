#!/usr/bin/pwsh

$NAME=$args[0]
$PROJECT=$args[1]

# Write-Output "name: $NAME"
# Write-Output "project: $PROJECT"

$user      = $Env:SONAR_USERNAME
$pass      = $Env:SONAR_PASSWORD
$pair      = "$($user):$($pass)"
$creds     = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuth = "Basic $creds"
$uri       = "http://localhost:9000/api/projects/create"

$Headers = @{
  Authorization = $basicAuth
}

$Form = @{
  name    = $NAME
  project = $PROJECT
}

$Response = Invoke-RestMethod `
-Headers $Headers `
-Uri $uri `
-Credential $credential `
-Method Post `
-Form $Form

Write-Output $Response