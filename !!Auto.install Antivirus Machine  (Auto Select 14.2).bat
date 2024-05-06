@echo off
color 0b

REM ╔════════════════════════════════════ ∘◦ ❉∘◦ ConFig Zone ❉ ◦∘ ◦∘ ═════════════════════════════════════════╗

SET SEP32-Path=\\sharefile.my.domain.com\ITI\AVMC_Install\HATC-M_SEP_14.2\HATC-M_Upgrade_32bit_No_Restart.exe
SET SEP64-Path=\\sharefile.my.domain.com\ITI\AVMC_Install\HATC-M_SEP_14.2\HATC-M_Upgrade_64bit_No_Restart.exe
SET VNC-Path=\\sharefile.my.domain.com\avmc\tightvnc-2.8.11-gpl-setup-32bit.msi
SET Detail-Path=\\sharefile.my.domain.com\ITI\AVMC_Install\Detail-MC
SET CS-Path=\\sharefile.my.domain.com\ITI\AVMC_Install\CSInstaller_v10306
rem SET DriveM-Path =


REM ╚════════════════════════════════════ ∘◦ ❉∘◦ ConFig Zone ❉ ◦∘ ◦∘ ════════════════════════════════════════╝
cls 
@echo off
:MENU
cls
ECHO -------------Select Number--------------
Echo 0.  Install CrowdStike
ECHO 1.  Install Sep (Auto Select)
ECHO 2.  Sep Not Connect (Select this number  Add Proxy 192.168.1.105:8080 ) 
ECHO ------------------------------------
ECHO ==========PRESS 'Q' TO QUIT==========
ECHO.
SET INPUT=
SET /P INPUT=Please select a number:
(
IF /I '%INPUT%'=='0' GOTO Crowdstrike
IF /I '%INPUT%'=='1' GOTO SEP
IF /I '%INPUT%'=='2' GOTO Sep-no-green
IF /I '%INPUT%'=='Q' GOTO Quit
)
 ELSE (
	GOTO MENU
)





:VNC
msiexec /i "%VNC-Path%" /quiet /norestart ADDLOCAL="Server,Viewer" VIEWER_ASSOCIATE_VNC_EXTENSION=1 SERVER_REGISTER_AS_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 VIEWER_ADD_FIREWALL_EXCEPTION=1 SERVER_ALLOW_SAS=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=@utobot SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=@utobot
goto SEP

:SEP
wmic bios get serialnumber > .\%computername%" Serial".txt
ipconfig /all >  .\%computername%" IPconfig".txt
systeminfo >  .\%computername%" Systeminfo".txt
xcopy .\%computername%" Serial.txt" %Detail-Path%
xcopy .\%computername%" IPconfig.txt" %Detail-Path%
xcopy .\%computername%" Systeminfo.txt" %Detail-Path%
if errorlevel 0 (
    echo Copy completed successfully
    del /Q %computername%" Serial.txt"
	del /Q %computername%" IPconfig.txt"
	del /Q %computername%" Systeminfo.txt"
	start \\sharefile.my.domain.com\ITI\AVMC_Install\Detail-MC
)

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT goto :SEP32
if %OS%==64BIT goto :SEP64



:SEP32
cls
Echo SEP 32bit Download from Server...
xcopy "%SEP32-Path%" ".\"  /C /D /E /H /I /R /Y /Z > result.txt
cd %~dp0
echo Running SEP_Install
start /wait HATC-M_Upgrade_32bit_No_Restart.exe
IF %ERRORLEVEL% == 0 goto add-proxy32

{
ELSE (
	goto add-proxy32
)


:SEP64
cls
Echo SEP 64bit Download from Server...
xcopy "%SEP64-Path%" ".\"  /C /D /E /H /I /R /Y /Z > result.txt
cd %~dp0
echo Running SEP_Install
start /wait HATC-M_Upgrade_64bit_No_Restart.exe
IF %ERRORLEVEL% == 0 goto add-proxy64
{
ELSE (
	goto add-proxy64
)

rem *************Install 64Bit************


:add-proxy64
cls
echo SEP Install_Complete...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d "http://192.168.1.101/HAT/aohatcm-o365.pac" /f
netsh interface ip set dns name="Wi-Fi" static 192.168.1.49
netsh interface ip set dns name="Wi-Fi 2" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection 1" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection 2" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection 3" static 192.168.1.49
echo Add Pacfile Successful...
C:\Windows\System32\control.exe inetcpl.cpl,,4
timeout 20
"C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\14.0.3929.1200.105\Bin\SymCorpUI.exe"
@pause
GOTO MENU


:add-proxy32
cls
echo SEP Install_Complete...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d "http://10.248.15.77/HATCM/aohatcm-o365.pac" /f
netsh interface ip set dns name="Wi-Fi" static 192.168.1.49
netsh interface ip set dns name="Wi-Fi 2" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection 1" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection 2" static 192.168.1.49
netsh interface ip set dns name="Wireless Network Connection 3" static 192.168.1.49
echo Add Pacfile Successful...
C:\Windows\System32\control.exe inetcpl.cpl,,4
timeout 20
"C:\Program Files\Symantec\Symantec Endpoint Protection\14.0.3929.1200.105\Bin\SymCorpUI.exe"
@pause
GOTO MENU

:Sep-no-green
cls
netsh winhttp set proxy 192.168.1.105:8080
ECHo Add Proxy 192.168.1.105:8080  Complete...
"C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\14.2.4815.1101.105\Bin\SymCorpUI.exe"
@pause
GOTO MENU

:Crowdstrike
cls
Echo Crowdstrike Download From Server...
xcopy "%CS-Path%" "C:\Crowdstrike" /C /D /E /H /I /R /Y /Z > c:\result.txt
echo Running Crowdstrike_Install
start /d "C:\Crowdstrike\" CSInstaller_v10306.vbs
timeout 25
Sc query csagent
@pause
GOTO MENU



:Quit
cls
exit