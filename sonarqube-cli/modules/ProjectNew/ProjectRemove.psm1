#!/usr/bin/pwsh

function Remove-Project {
  param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectKey
  )
  
  $user      = $Env:SONAR_USERNAME
  $pass      = $Env:SONAR_PASSWORD
  $pair      = "$($user):$($pass)"
  $creds     = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
  $basicAuth = "Basic $creds"
  $uri       = "http://localhost:9000/api/projects/delete"

  $Headers = @{
    Authorization = $basicAuth
  }

  $Form = @{
    project = $ProjectKey
  }

  $Response = Invoke-RestMethod `
  -Headers $Headers `
  -Uri $uri `
  -Credential $credential `
  -Method Post `
  -Form $Form

  if($Env:SONARQUBE_CLI_DEBUG -eq 'TRUE') {
      Write-Output $Response
  }
}

Export-ModuleMember -Function Remove-Project
