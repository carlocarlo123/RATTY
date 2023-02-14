' alt w to disable pop up
' alt r  -run the executable


Set ws=CreateObject("wscript.shell")

wscript.sleep(1000)
ws.SendKeys("%w")
ws.SendKeys("%r")
