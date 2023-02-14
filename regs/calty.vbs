Dim ws
Set ws=WScript.CreateObject("WScript.Shell")
WScript.Sleep 1000
ws.SendKeys("%y")
WScript.Sleep 1000
ws.Sendkeys("%y")
WScript.Sleep 1000
ws.SendKeys("{ENTER}")




