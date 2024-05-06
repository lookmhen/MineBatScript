@echo off
color 0b
chcp 65001

:MENU
cls
echo  ╔════════ ∘◦ ❉∘◦ Backup Desktop Icon Layout ❉ ◦∘ ◦∘ ═════════╗

ECHO  -------------Select Number----------
Echo  1.  save desktop icon layout
ECHO  2.  Restore desktop icon layout
ECHO  ------------------------------------

echo  ╚════════ ∘◦ ❉∘◦ Backup Desktop Icon Layout ❉ ◦∘ ◦∘ ═════════╝



SET INPUT=
SET /P INPUT=Please select a number:
(
IF /I '%INPUT%'=='1' GOTO save
IF /I '%INPUT%'=='2' GOTO restore
IF "%INPUT%"=="" GOTO MENU
GOTO MENU
)


:save
echo d | xcopy C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\*.* d:\++Bkuser\%username%\wallpaper
reg export "HKCU\Control Panel\Desktop\WindowMetrics" "d:\%username%-desktoplayout-WindowMetrics.reg" /y
reg export "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" "d:\%username%-desktoplayout.reg" /y
msg * "Save layout complete"
cls
exit



:restore
rem xcopy d:\++Bkuser\%username%\wallpaper\*.png
regedit.exe /s d:\%username%-desktoplayout-WindowMetrics.reg
regedit.exe /s d:\%username%-desktoplayout.reg
taskkill /f /IM explorer.exe
start explorer.exe
exit