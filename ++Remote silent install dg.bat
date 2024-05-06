@echo OFF
color 0b
chcp 65001

set /p useradmin= Enter Username(Admin) :
set /p adminpass= Enter Password :


:start
set /p pcname=Computer Name :

rem set /p run=Drag & DropHere Or Input Something :  

rem Path ที่อยู่โปรแกรม  หรือคำสั่งที่จะใช้งาน *********
set run=msiexec /i "\\dmit18101\Shared for Set new Computer\3. Digital Gardian\Agent x64\DG Agent 7.6.2.0058_EN_Agent_v5.msi" /uninstall /quiet /qn /norestart
rem Path ที่อยู่โปรแกรม หรือคำสั่งที่จะใช้งาน *********

\\dmit18101\Script\PSTools\PsExec.exe -nobanner \\%pcname% -u  apu\%useradmin% -p %passadmin%   %run%

goto start
@pause