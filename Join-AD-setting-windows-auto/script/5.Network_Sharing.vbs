Set WshShell = WScript.CreateObject("WScript.Shell")

rem เข้า  Advanced Sharing Settings
WshShell.Run "control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced"
WScript.Sleep 5000
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 300

rem Turn On
WshShell.SendKeys "{UP}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 300
WshShell.SendKeys "{UP}"
WScript.Sleep 200

rem Save Sharing Settings
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys " "
WScript.Sleep 200
WshShell.SendKeys "%{f4}"
WScript.Sleep 300

rem Run Script 6.Copy_Setting.vbs
WshShell.Run "D:\setting-windows\script\6.Copy_Setting.vbs"
WScript.Quit