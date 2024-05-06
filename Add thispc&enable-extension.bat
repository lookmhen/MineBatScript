
rem *****Create This PC on Desktop*****
echo y | reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f

rem *****Show File Name Extensions*****
echo y | reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f

rem *****Open file explorer to this pc*****
echo y | reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v LaunchTo /t REG_DWORD /d 1 /f

rem Open Defualt app setting
rem explorer.exe shell:::{17cd9488-1228-4b2f-88ce-4298e93e0966} -Microsoft.DefaultPrograms\pageDefaultProgram

@pause