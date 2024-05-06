@echo off
rem Add NetJoinLegacyAccountReuse
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v NetJoinLegacyAccountReuse /t REG_DWORD /d 1 /f

rem Delete Microsoft Teams " ปิดตัว  Microsoft Teams "
echo y | reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v com.squirrel.Teams.Teams
rem Delete ThinkVantage Fingerprint Software " ปิดตัว ThinkVantage Fingerprint Software "
echo y | reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v PSQLLauncher

rem Restart Computer
shutdown -r -f -t 00