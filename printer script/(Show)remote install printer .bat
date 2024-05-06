@echo OFF
color e
chcp 65001
:start
set /p pcname=Computer Name :
set /p run=Drag and DropHere :
rem \\dmit18101\Script\PSTools\PsExec.exe -nobanner \\%pcname% -u apu\hatcmit_admin  %p% -i
\\dmit18101\Script\PSTools\PsExec.exe -nobanner \\%pcname% -i -s  %run%
goto start
@pause