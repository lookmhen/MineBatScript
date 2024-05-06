@echo off


:seviceselfcheck
FOR %%a IN (QlikViewDistributionService) DO (

rem ------Check service still alive--------


SC query %%a | FIND /i "RUNNING"
IF ERRORLEVEL 1 goto :failrunning


SC query %%a | FIND /i "RUNNING"
IF ERRORLEVEL 0 goto success


)

rem ------Check service still alive--------


:failrunning
for /f %%a in ('powershell -Command "Get-Date -format hh:mm:-tt"') do set timestamp=%%a
echo ------- Service Fail on %date%--%timestamp%------------------- >> D:\Killservice\Qlikvie-fail-log.txt
goto startservice


:startservice
sc start QlikViewDistributionService
goto seviceselfcheck




:success
for /f %%a in ('powershell -Command "Get-Date -format hh:mm:-tt"') do set timestamp=%%a
echo ------- Service Running on %date%--%timestamp%------------------- >> D:\Killservice\Qlikvie-fail-log.txt
exit