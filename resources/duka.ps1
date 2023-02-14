function getstatusvista
{
$EnableLUA =(Get-ItemProperty -Path HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System).EnableLUA
if($EnableLUA -eq  0)
{
Write-Host "UAC is disabled"
Set-ItemProperty -Path HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 1 -Type DWord
Write-Host "Enabling UAC ......Settings will be effective after restart"
}
else
{
Write-Host "UAC is Enabled"
Set-ItemProperty -Path HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0 -Type DWord
Write-Host "Disabling the UAC......Settings will be effective after restart"
}
}