
rem Add Current User

rem ++++++++++++++++++++++++++++++++++++++++++++ internet zone ++++++++++++++++++++++++++++++++++++++++++++++++++++

rem Allow web pages to use restricted protocols for active content = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 2300 /t REG_DWORD /d 0  /f

rem Allow websites to open windows without address or status bars = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 2104 /t REG_DWORD /d 0  /f

rem Include local directory path when uploading files to a server = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 160A /t REG_DWORD /d 0  /f

rem render legacy filter = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 270B /t REG_DWORD /d 0  /f

rem ++++++++++++++++++++++++++++++++++++++++++++ internet zone ++++++++++++++++++++++++++++++++++++++++++++++++++++



rem ++++++++++++++++++++++++++++++++++++++++++++ Local Intranet zone ++++++++++++++++++++++++++++++++++++++++++++++++++++

rem Allow web pages to use restricted protocols for active content = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 2300 /t REG_DWORD /d 0  /f

rem Allow websites to open windows without address or status bars = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 2104 /t REG_DWORD /d 0  /f

rem Include local directory path when uploading files to a server = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 160A /t REG_DWORD /d 0  /f

rem render filter = "Enable"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 270B /t REG_DWORD /d 0  /f

rem add .honda.com to intranet zone
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\honda.com" /v * /t REG_DWORD /d 1 /f


rem ++++++++++++++++++++++++++++++++++++++++++++ Local Intranet zone ++++++++++++++++++++++++++++++++++++++++++++++++++++