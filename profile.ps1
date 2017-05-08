#(Get-Host).UI.RawUI.ForegroundColor = "White"
#(Get-Host).UI.RawUI.BackgroundColor = "DarkBlue"

function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VS2017()
{
	$vsPath = (Get-VsSetupInstance).InstallationPath
    $vsCommonTools = [System.IO.Path]::Combine($vsPath, "Common7", "tools")
    $batchFile = [System.IO.Path]::Combine($vsCommonTools, "VsDevCmd.bat")
    Get-Batchfile $BatchFile
	
    [System.Console]::Title = "Visual Studio 2017 Windows PowerShell"
	Write-Host "Visual Studio 2017 Windows PowerShell"
}

function debug
{
	$debugPath = [System.IO.Path]::Combine($pwd, "bin", "debug")
	
	if(Test-Path $debugPath)
	{
		Set-Location $debugPath
	}
	else
	{
		Write-Host "Path not found within directory."
	}
}

function build($solutionPath)
{
	msbuild $solutionPath /m /t:"clean;rebuild"
}

#Vim Config
$VIMPATH    = "C:\Program Files (x86)\Vim\vim80\vim.exe"

Set-Alias vi   $VIMPATH
Set-Alias vim  $VIMPATH

#
# Add redshells
#

import-module RedShells

set-alias go Set-Workspace
set-alias addw Add-Workspace
set-alias getw Get-Workspaces
set-alias delw Remove-Workspace
set-alias auto Invoke-Script
set-alias adds Add-Script
set-alias gets Get-Scripts
set-alias dels Remove-Script
# set-alias copy-f Write-Clipboard
# set-alias paste-f Read-Clipboard
set-alias gvim "C:\Program Files (x86)\vim\vim80\gvim.exe"

# import-module sqlps -disablenamechecking

# set home
$env:HOMEDRIVE = 'C:'
$env:HOMEPATH = '\'

# set path
# $env:Path += ';D:\users\vitalim\shell'

# "Visual Studio 2017 Windows PowerShell"
"powered by redshells"
VS2017
""

#set this
set-location ""
(get-psprovider 'FileSystem').Home = "C:"
