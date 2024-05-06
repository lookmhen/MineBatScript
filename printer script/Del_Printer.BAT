
rem ใช้ลบDriverโดยไม่ต้องlogin user admin (run different)
@echo off

chcp 65001
CLS
:start

echo ╔══════════════════════════╗
echo  ❉∘ Delete exist Printer ∘❉
echo ╚══════════════════════════╝

wmic printer list brief 
set /p printer=input printerName  :

REM Delete exist Printer (จะลบตัวเดิมออกก่อนถ้าเคยติดตั้งแล้ว)
CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prnmngr.vbs -d -p "%printer%" 

wmic printer list brief 
@pause
CLS
goto start