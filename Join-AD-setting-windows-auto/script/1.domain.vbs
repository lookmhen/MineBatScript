Set WshShell = WScript.CreateObject("WScript.Shell")
nameblank = True
comname = InputBox("Computer Name")
if comname <> "" then nameblank = False
if not nameblank Then
password = InputBox("Input Password for admin")
WshShell.Run "control.exe sysdm.cpl"
WScript.Sleep 8000
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys " "
WScript.Sleep 2000
WshShell.SendKeys comname
WScript.Sleep 2000
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{UP}"
WScript.Sleep 500
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "mydomain.com"
WScript.Sleep 500
WshShell.SendKeys "{TAB}"
WScript.Sleep 500
WshShell.SendKeys "{Enter}"
WScript.Sleep 1000
WshShell.SendKeys "{Enter}"
WScript.Sleep 8000
WshShell.SendKeys "tm007902"
WScript.Sleep 500
WshShell.SendKeys "{TAB}"
WScript.Sleep 500
WshShell.SendKeys password
WScript.Sleep 500
WshShell.SendKeys "{TAB}"
WScript.Sleep 500
WshShell.SendKeys "{Enter}"
WScript.Sleep 4000
WshShell.SendKeys "{Enter}"
WScript.Sleep 4000
WshShell.SendKeys "{Enter}"
WScript.Sleep 5500
WshShell.SendKeys "{TAB}"
WScript.Sleep 500
WshShell.SendKeys "{Enter}"
WScript.Sleep 4000
WshShell.SendKeys "{Enter}"
WScript.Sleep 4000
WshShell.SendKeys "{Enter}"
WScript.Quit
Else
MsgBox "Pleae Input Comname"
end if