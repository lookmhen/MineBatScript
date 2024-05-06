@echo off
set /p name=Input Name:
set /p iconpath=Input IconPath:
set /p runpath=Input-run-path:

rem ******** /ve สำหรับ Modify defualt key ปกติจะใช้ /v สำหรับkeyที่ไม่ใช่ default


reg add HKCR\Directory\Background\shell\%name% /ve /t REG_SZ /d "%name%" /f

reg add HKCR\Directory\Background\shell\%name% /v Icon /t REG_SZ /d "%iconpath%" /f

reg add HKCR\Directory\Background\shell\%name%\command /ve /t REG_SZ /d "%runpath%"  /f

@pause

