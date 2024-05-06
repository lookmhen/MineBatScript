@echo off
color 0b
cls
echo Fix memory NarJAr
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Managemen" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfecth /f


REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f

REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f

REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f

sc config "SysMain" start=disabled

sc config "StorSvc" start=disabled

rem sc config "WSearch" start=disabled


cls


echo Fixed completed must be restart
SET INPUT=
SET /P INPUT=Y/N:
(
IF /I '%INPUT%'=='y' GOTO restart
IF /I '%INPUT%'=='n' GOTO exit
)
 ELSE (
	GOTO exit
)

:restart
shutdown -r -f -t 00
