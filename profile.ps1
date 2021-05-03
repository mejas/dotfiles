function Initialize-Build16()
{
    $installPath = [System.IO.Path]::Combine((Get-VSSetupInstance -Prerelease).InstallationPath, "Common7\Tools")
	
	if(Test-Path $installPath)
	{
		Write-Host "`nVisual Studio 2019 variables initializing..." -ForegroundColor Yellow -NoNewLine
		
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
		
		Write-Host "set!" -ForegroundColor Yellow
	}
	else
	{
		Write-Host "Unable to find Visual Studio tools." -ForegroundColor Yellow -NoNewLine
	}
}

# basically gives the shell directory formatting and color
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

# set home
$env:HOMEDRIVE = 'C:'
$env:HOMEPATH = '\'

"powered by redshells"

Initialize-Build16
set-location "C:\Users\delossantosj\Documents\git"
(get-psprovider 'FileSystem').Home = "C:"
""
