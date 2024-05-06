if not exist d:\status.txt (goto gpupdate) else (goto next)
:gpupdate
timeout 5
echo gpupdate /force
echo 1 > d:\status.txt
echo shutdown -r -f -t 00
pause > nul
exit
:next
del d:\status.txt
pause > nul
exit
rem echo y | reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v com.squirrel.Teams.Teams
rem echo y | reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v PSQLLauncher
rem cscript D:\setting-windows\script\3.Werm.vbs