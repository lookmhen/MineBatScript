Set WshShell = WScript.CreateObject("WScript.Shell")
Set obj = createobject("Scripting.FileSystemObject")
rem เข้า  Administrative ที่อยู่ในส่วนของ  Region
WshShell.Run "control.exe intl.cpl ,1"
WScript.Sleep 5000
WshShell.SendKeys "{Enter}"
WScript.Sleep 1000

rem Copy Settings...
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys " "
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys " "
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{Enter}"
WScript.Sleep 500

rem Save Region
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "{Enter}"
WScript.Sleep 200

rem Delete Script 2.GPUpdate.bat ที่อยู่ใน StartUp
obj.DeleteFile "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\2.GPUpdate.bat"
WScript.Sleep 500

rem Run Script Connet_All-Honda.bat
WshShell.Run "D:\setting-windows\Connet_All-Honda.bat"