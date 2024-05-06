@echo off
cls

for /F "tokens=*" %%A in ('dir/b c:\users\*.*') do (
echo f | xcopy "C:\Users\%%A\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" "d:\++Bkuser\%%A\"
)

