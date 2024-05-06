Set WshShell = WScript.CreateObject("WScript.Shell")

rem เข้า Languages Bar ที่อยู่ในส่วนของ  Text Services and Input Languages
WshShell.Run "rundll32.exe Shell32.dll,Control_RunDLL input.dll,,{C07337D3-DB2C-4D0B-9A93-B722A6C106E2}"
WScript.Sleep 9000
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
WshShell.SendKeys "{Right}"
WScript.Sleep 200

rem อยู่ในส่วนของ  Advanced Key Settings
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys " "
WScript.Sleep 4000

rem เข้า  Change Key Sequence
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{Down}"
WScript.Sleep 200
WshShell.SendKeys "{Down}"
WScript.Sleep 200
WshShell.SendKeys "{Down}"
WScript.Sleep 200
WshShell.SendKeys "{Enter}"
WScript.Sleep 200

WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{Enter}"
WScript.Sleep 200

rem Run Script 4.Add_a_Language.bat
WshShell.Run "D:\setting-windows\script\4.Add_a_Language.bat"
WScript.Quit