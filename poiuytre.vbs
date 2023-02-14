Dim abcdef
set abcdef = WScript.CreateObject("WScript.Shell")
Dim xyzA
xyzA=Shell.CurrentDirectory

QWERtyu = "powershell.exe -nologo -command "+xyzA+"\intial.ps1"
abcdef.Run QWERtyu,0