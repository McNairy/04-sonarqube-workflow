#!/usr/bin/pwsh

$LOGIN = $args[0]
$NAME  = $args[1]

if($LOGIN -eq '') {
  Write-Output "Error: Login not provided. Exiting."
  Exit 1
}

if($NAME -eq '') {
  Write-Output "Error: Name not provided. Exiting."
  Exit 1
}

# Write-Output "login: $LOGIN"
# Write-Output "name: $NAME"

$user      = $Env:SONAR_USERNAME
$pass      = $Env:SONAR_PASSWORD
$pair      = "$($user):$($pass)"
$creds     = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuth = "Basic $creds"
$uri       = "http://localhost:9000/api/user_tokens/generate"

$Headers = @{
    Authorization = $basicAuth
}

$Form = @{
  name  = $NAME
  login = $LOGIN
}

$Response = Invoke-RestMethod `
  -Headers $Headers `
  -Uri $uri `
  -Credential $credential `
  -Method Post `
  -Form $Form

Write-Output $Response