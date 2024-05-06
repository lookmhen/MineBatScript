@echo off

rem Connect WiFi ALLHONDAWLAN
netsh wlan connect ssid=ALLHONDAWLAN name=ALLHONDAWLAN

rem Delete WiFi IT " Forget IT "
netsh wlan delete profile name=IT

rem Check WiFi
netsh wlan show profile

rem Run Script Delete_Set-win.bat
cmd /c "D:\setting-windows\Delete_Set-win.bat"