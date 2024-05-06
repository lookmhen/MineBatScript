@echo off
setlocal enabledelayedexpansion

set hostfile=%windir%\System32\drivers\etc\hosts
set target_host=myweb.co.th
set target_ip=192.168.1.200
 
REM Check if the script is running with administrative privileges
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"

if %errorlevel% neq 0 (
    echo This script requires administrative privileges.
    pause
    exit /b
)

REM Check if the target entry already exists in the Hosts file
findstr /i /c:"%target_host%" "%hostfile%" >nul 2>&1

if %errorlevel% equ 0 (
    REM Entry already exists, so modify it
    echo Modifying existing entry for %target_host%
    (
        for /f "usebackq tokens=*" %%a in ("%hostfile%") do (
            echo %%a | findstr /i /c:"%target_host%" >nul 2>&1
            if !errorlevel! equ 0 (
                echo %target_ip% %target_host%
            ) else (
                echo %%a
            )
        )
    ) >"%hostfile%.tmp"

    move /y "%hostfile%.tmp" "%hostfile%" >nul
) else (
    REM Entry doesn't exist, so add it
    echo Adding new entry for %target_host%
    echo %target_ip% %target_host% >>"%hostfile%"
)

echo Hosts file has been updated.
pause
