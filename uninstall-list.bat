@echo off

set "key_path=SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"

:: Open the registry key
reg query "HKLM\%key_path%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Registry key not found.
    exit /b
)

for /f "tokens=*" %%A in ('reg query "HKLM\%key_path%" /s') do (
    set "line=%%A"
    setlocal enabledelayedexpansion
    if "!line:DisplayName=!" neq "!line!" (
        set "display_name=!line:*DisplayName    REG_SZ=!"
        echo DisplayName: !display_name!
    )
    if "!line:UninstallString=!" neq "!line!" (
        set "uninstall_string=!line:*UninstallString    REG_SZ=!"
        echo UninstallString: !uninstall_string!
	  echo -------------------------------------------------------------------------
    )
    endlocal
) >> c:\test.txt

@pause