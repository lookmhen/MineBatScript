@echo off

rem Copy setting-windows ไปไว้ใน  ไดฟ์  D
echo D | xcopy \\dmit18101\Script\setting-windows\ D:\setting-windows\ /s /e /o /k

rem Copy 2.GPUpdate.bat ไปไว้ใน  StartUp
echo D | xcopy d:\setting-windows\script\2.GPUpdate.bat "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"

rem Delete Microsoft Teams " ปิดตัว  Microsoft Teams "
echo y | reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v com.squirrel.Teams.Teams
rem Delete ThinkVantage Fingerprint Software " ปิดตัว ThinkVantage Fingerprint Software "
echo y | reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v PSQLLauncher

rem Run Script 1.domain.vbs
cscript "D:\setting-windows\script\1.domain.vbs"