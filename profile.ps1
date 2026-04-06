function Initialize-Build($instance) {
	$toolsPath =
	[System.IO.Path]::Combine(
		$instance.InstallationPath,
		"Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
	
	if (Test-Path $toolsPath) {
		Write-Host ("`n{0} variables initializing..." -f $instance.DisplayName) -ForegroundColor Yellow
		
		Import-Module $toolsPath
		Enter-VsDevShell $instance.InstanceId -SkipAutomaticLocation
		
		Write-Host "set!" -ForegroundColor Yellow
	}
	else {
		Write-Host "Unable to find Visual Studio tools." -ForegroundColor Yellow -NoNewLine
	}
}

$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1

if($PSVersionTable.PSVersion.Major -gt 5)
{
	# vs 2019 => [16.0,17.0)
	Initialize-Build(
		(Get-VSSetupInstance -Prerelease | Select-VSSetupInstance -Latest))

	$redshells =
	 [System.IO.Path]::Combine(
		$profileDir,
		"Modules\redshells\Redshells.PowerShell.dll");
	
	Import-Module $redshells

	set-alias go Set-Workspace
	set-alias addw New-Workspace
	set-alias getw Get-Workspace
	set-alias delw Remove-Workspace
}

Import-Module posh-git

$GitPromptSettings.BeforePath = '['
$GitPromptSettings.BeforePath.ForegroundColor = 0x90EE90
$GitPromptSettings.AfterPath = ']'
$GitPromptSettings.AfterPath.ForegroundColor = 0x90EE90
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 0x90EE90
$GitPromptSettings.PathStatusSeparator.Text = $null
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
