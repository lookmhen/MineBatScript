@echo OFF
color 0b
chcp 65001
cls
:start
set /p pcname=Computer Name :
set /p Run=Drag and DropHere :
\\dmit18101\Script\PSTools\PsExec.exe -nobanner \\%pcname% -u apu\hatcmit_admin -p "P@ssw0rd" %Run%
rem \\dmit18101\Script\PSTools\PsExec.exe -nobanner \\%pcname% -i -s  %Run%
goto start
@pause