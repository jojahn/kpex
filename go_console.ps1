# Name: go_console.ps1
# Function: Create a new console
# Date: 04.11.2020
# Author: jojahn

function Get-RootDirectory
{
    return Split-Path -Parent $PSCommandPath
}

function Update-GoPaths([string] $ScriptDir)
{
    Write-Host $ScriptDir
    $env:GOPATH="${env:GOPATH};${ScriptDir}\go\codebase\src"
}

Update-GoPaths $(Get-RootDirectory)