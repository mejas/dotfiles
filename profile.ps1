function Initialize-Build($instance)
{
    $toolsPath =
		[System.IO.Path]::Combine(
			$instance.InstallationPath,
			"Common7\Tools")
	
	if(Test-Path $toolsPath)
	{
		Write-Host ("`n{0} variables initializing..." -f $instance.DisplayName) -ForegroundColor Yellow -NoNewLine
		
		pushd $toolsPath
		
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

# # basically gives the shell directory formatting and color
function prompt {
    $origLastExitCode = $LASTEXITCODE

    $prompt = ""

    $prompt += Write-Prompt "[$($ExecutionContext.SessionState.Path.CurrentLocation)" -ForegroundColor LightGreen
    $prompt += Write-VcsStatus
    $prompt += Write-Prompt "]`n" -ForegroundColor LightGreen
    $prompt += "$('>' * ($nestedPromptLevel + 1)) "

    $LASTEXITCODE = $origLastExitCode
    $prompt
}

#
# Add redshells
#

import-module RedShells
import-module posh-git

set-alias go Set-Workspace
set-alias addw Add-Workspace
set-alias getw Get-Workspaces
set-alias delw Remove-Workspace
set-alias auto Invoke-Script
set-alias adds Add-Script
set-alias gets Get-Scripts
set-alias dels Remove-Script

"powered by redshells"

# vs 2019 => [16.0,17.0)
Initialize-Build(
	(Get-VSSetupInstance -Prerelease | Select-VSSetupInstance -Version '17.0'))

set-location "C:\Users\delossantosj\Documents\git"
""
