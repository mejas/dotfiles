#(Get-Host).UI.RawUI.ForegroundColor = "White"
#(Get-Host).UI.RawUI.BackgroundColor = "DarkBlue"

function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VS2008()
{
    $vs90comntools = (Get-ChildItem env:VS90COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs90comntools, "vsvars32.bat")
    Get-Batchfile $BatchFile

    [System.Console]::Title = "Visual Studio 2008 Windows PowerShell"
}

function VS2010()
{
    $vs100comntools = (Get-ChildItem env:VS100COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs100comntools, "vsvars32.bat")
    Get-Batchfile $BatchFile

    [System.Console]::Title = "Visual Studio 2010 Windows PowerShell"
}

function VS2012()
{
    $vs110comntools = (Get-ChildItem env:VS110COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs110comntools, "VsDevCmd.bat")
    Get-Batchfile $BatchFile

    [System.Console]::Title = "Visual Studio 2012 Windows PowerShell"
}

function VS2013()
{
    $vs120comntools = (Get-ChildItem env:VS120COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs120comntools, "VsDevCmd.bat")
    Get-Batchfile $BatchFile

    [System.Console]::Title = "Visual Studio 2012 Windows PowerShell"
}

function VS2015()
{
    $vs140comntools = (Get-ChildItem env:VS140COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs140comntools, "VsDevCmd.bat")
    Get-Batchfile $BatchFile

    [System.Console]::Title = "Visual Studio 2012 Windows PowerShell"
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
$VIMPATH    = "C:\Program Files (x86)\Vim\vim74\vim.exe"

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
set-alias gvim "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# import-module sqlps -disablenamechecking

# set home
$env:HOMEDRIVE = 'D:'
$env:HOMEPATH = '\'

# set path
# $env:Path += ';D:\users\vitalim\shell'

# "Visual Studio 2012 Windows PowerShell"
"powered by redshells"

""
VS2015
set-location "D:\Users\delossj\git"
(get-psprovider 'FileSystem').Home = "D:"
