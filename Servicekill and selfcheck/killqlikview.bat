taskkill /IM QVDistributionService.exe /F >> D:\Killservice\QlikviewServicelog.txt
timeout 20 

net start QlikViewDistributionService >> D:\Killservice\QlikviewServicelog.txt
timeout 60

rem ------Check service still alive--------
:running
FOR %%a IN (QlikViewDistributionService) DO (

SC query %%a | FIND /i "RUNNING"
IF ERRORLEVEL 1 goto :failrunning

SC query %%a | FIND /i "RUNNING"
IF ERRORLEVEL 0 goto success



)
rem ------Check service still alive--------



:success
sc query QlikViewDistributionService >> D:\Killservice\QlikviewServicelog.txt
for /f %%a in ('powershell -Command "Get-Date -format hh:mm:-tt"') do set timestamp=%%a
echo ---------------%date%--%timestamp%------------------- >> D:\Killservice\QlikviewServicelog.txt
exit



:failrunning
SC start QlikViewDistributionService
goto running

