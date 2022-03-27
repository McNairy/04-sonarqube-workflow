#!/usr/bin/pwsh

function New-Project {
  param(
    [Parameter(Mandatory=$true)]
    [string]$Project,

    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$false)]
    [ValidateSet("private", "public")]
    [string]$Visibility
  )
  
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
    name       = $Name
    project    = $Project
    visibility = $Visibility
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

Export-ModuleMember -Function New-Project
