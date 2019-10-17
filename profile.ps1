function Initialize-Build16()
{
	Write-Host "`nVisual Studio 2019 variables initializing..." -ForegroundColor Yellow

    $installPath = [System.IO.Path]::Combine((Get-VSSetupInstance 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Preview').InstallationPath, "Common7\Tools")
	pushd $installPath
	
	cmd /c "VsDevCmd.bat&set" |	foreach	{
		if ($_ -match "=")
		{
			$v = $_.split("=");
			#Write-Host $v[0] : $v[1]
			set-item -Path ("env:{0}" -f $v[0]) -Value ($v[1])
		}
	}
	popd
	
	Write-Host "`nVisual Studio 2019 variables set." -ForegroundColor Yellow
}

function Initialize-Build15
{
	Write-Host "`nVisual Studio 2017 variables initializing..." -ForegroundColor Yellow

    $installPath = [System.IO.Path]::Combine((Get-VSSetupInstance).InstallationPath, "Common7\Tools")
	pushd $installPath
	
	cmd /c "VsDevCmd.bat&set" |	foreach	{
		if ($_ -match "=")
		{
			$v = $_.split("=");
			#Write-Host $v[0] : $v[1]
			set-item -Path ("env:{0}" -f $v[0]) -Value ($v[1])
		}
	}
	popd
	
	Write-Host "`nVisual Studio 2017 variables set." -ForegroundColor Yellow
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

function prompt {
    $origLastExitCode = $LASTEXITCODE

    $prompt = ""

    $prompt += Write-Prompt "[$($ExecutionContext.SessionState.Path.CurrentLocation)" -ForegroundColor Green
    $prompt += Write-VcsStatus
    $prompt += Write-Prompt "]`n" -ForegroundColor Green
    $prompt += "$('>' * ($nestedPromptLevel + 1)) "

    $LASTEXITCODE = $origLastExitCode
    $prompt
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
set-alias gvim "C:\Program Files (x86)\Vim\vim80\gvim.exe"

# set home
$env:HOMEDRIVE = 'C:'
$env:HOMEPATH = '\'

# "Visual Studio 2017 Windows PowerShell"
"powered by redshells"

""
Initialize-Build15
set-location ""
(get-psprovider 'FileSystem').Home = "C:"
""
