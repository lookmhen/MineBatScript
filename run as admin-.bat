@echo OFF
color e
chcp 65001
:start
set /p p=Drag and Drop HERE :
runas /env /savecred /user:apu\tm007902 %p%
goto start