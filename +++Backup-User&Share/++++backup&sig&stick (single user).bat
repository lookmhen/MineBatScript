@echo off
rem echo %DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%
cls
:menu
color 0b
echo                                          *+**+**+**+**+**+**+*
echo                                           *0* Backup User *0*
echo                                          *+**+**+**+**+**+**+*
echo Select number
echo 1.Backup
echo 2.Restore
SET number=
set /p number=Input number:
(
IF /I '%number%'=='1' GOTO Backup
IF /I '%number%'=='2' GOTO Restore
)

:Backup
set /p bkuser=Input user:
echo d | xcopy "C:\Users\%bkuser%\*" "d:\++Bkuser\%bkuser%" /k /o /s /e
echo d | xcopy C:\Users\%bkuser%\AppData\Roaming\Microsoft\Signatures\* "d:\++Bkuser\%bkuser%\sig&stick\Signatures" /s
echo d | xcopy "C:\Users\%bkuser%\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\*.*" "d:\++Bkuser\%bkuser%\sig&stick\stick" /s
echo d | xcopy C:\Users\%bkuser%\AppData\Roaming\SAP\* "d:\++Bkuser\%bkuser%\SAP /s
@pause
cls
start d:\++Bkuser
goto menu

:Restore
set /p bkuser=Input user:
echo backup user to drive c 
echo a | xcopy "d:\++Bkuser\%bkuser%\*" "C:\Users\%bkuser%\*.*" /k /o /s /e
echo backup signatures to folder
echo a | xcopy "d:\++Bkuser\%bkuser%\sig&stick\Signatures\*.*" "C:\Users\%bkuser%\AppData\Roaming\Microsoft\Signatures\" /s
echo backup StickyNotes to folder
echo a | xcopy "d:\++Bkuser\%bkuser%\sig&stick\stick\*.*" "C:\Users\%bkuser%\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\" /s
echo d | xcopy "d:\++Bkuser\%bkuser%\SAP\*" "C:\Users\%bkuser%\AppData\Roaming\SAP\ /s
@pause
cls
goto menu
@pause 


