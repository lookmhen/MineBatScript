@echo off
ipconfig /all
@pause
rem ยังไม่ได้เทส set /p comname=Input name :
set /p ip=input IP :
set /p gateway=input gateway :
rem ยังไม่ได้เทส WMIC ComputerSystem where Name= "COMPUTER-NAME" call Rename Name=%comname%
netsh interface ipv4 set address name="Ethernet" static %ip% 255.255.255.0 %gateway%
ipconfig /all
@pause