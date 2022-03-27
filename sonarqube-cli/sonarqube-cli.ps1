#!/usr/bin/pwsh

param(
  [Parameter(Position=0, Mandatory=$False)]
  [ValidateSet("new-project", "remove-project")]
  [string]$Command,

  [Parameter(Position=1, ValueFromRemainingArguments=$true)]
  $Options
)

Import-Module ProjectNew
Import-Module ProjectRemove

switch( $Command ) {
  "new-project" {
    if($null -eq $Options[2]) {
      New-Project `
        -Project $Options[0] `
        -Name $Options[1]
    } else {
      New-Project `
        -Project $Options[0] `
        -Name $Options[1] `
        -Visibility $Options[2]
    }
  }
  "remove-project" {
    Remove-Project -Project $Options[0]
  }
}