CLS
@ECHO off

REM Change Page code utf-8
chcp 65001
color 0b


CLS

REM ╔════════════════════════════════════ ∘◦ ❉∘◦ ConFig Zone ❉ ◦∘ ◦∘ ═════════════════════════════════════════╗

REM varIP = IP เครื่องPrinterที่ ADD
SET varIP=192.168.1.11

REM varDriver = ชื่อไดร์เวอร์ของPrinter ที่ ADD Copy ชื่อจากด้านในไฟล์  .INF
SET varDriver=RICOH MP C6004ex PCL 6

REM varDriver = ตำแหน่งของ Directory ของ Driver
SET varDriverFolder=\\dmit18101\Printer Script\Driver Printer\Ricoh MP C6004ex\Win10\disk1

REM varDriverFile = ตำแหน่งของไฟล์ .INF (** นามสกุล.inf จำเป็นต้องพิมนามสกุลตัวใหญ่ตัวเล็กตาม .inf หรือ .INF ให้เหมือนชื่อไฟล์ที่จะใช้งาน  **) 
SET varDriverFile=\\dmit18101\Printer Script\Driver Printer\Ricoh MP C6004ex\Win10\disk1\oemsetup.inf

REM varName = ตั้งชื่อPrinter
SET varName=GA Color (192.168.1.11)

REM varLocation= Location Printer เช่น "Copier Room."
SET varLocation=GA

REM ╚═════════════════════════════════════ ∘◦ ❉∘◦ ConFig Zone ❉ ◦∘ ◦∘ ════════════════════════════════════════╝

CLS


REM ถ้าใช้งานต่ำกว่า Windows 10 ตำแหน่งของ .vbs อาจจะเป็น   %windir%\system32\


REM "Deleting TCP/IP port"
CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prnport.vbs -d -r %varIP%

CLS

REM "Creating TCP/IP port"
CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r %varIP% -o raw -n 9100 -h %varIP%

echo ----------------------
echo ╔═════════════════╗
echo  ❉∘ Load Driver ∘❉
echo ╚═════════════════╝

REM Load Driver
CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prndrvr.vbs -a -m "%varDriver%" -h "%varDriverFolder%" -i "%varDriverFile%"  

echo  -----------------------------
echo ╔══════════════════════════╗
echo  ❉∘ Delete exist Printer ∘❉
echo ╚══════════════════════════╝

REM Delete exist Printer (จะลบตัวเดิมออกก่อนถ้าเคยติดตั้งแล้ว)
CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prnmngr.vbs -d -p "%varName%" 

echo  ---------------------------------


REM Add name+driver+ip printer
CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prnmngr.vbs -a -p "%varName%" -m "%varDriver%" -r "%varIP%"


echo  -----------------------------------------

CSCRIPT /nologo %windir%\system32\Printing_Admin_Scripts\en-US\prncnfg.vbs -t -p "%varName%" -l "%varLocation%"


echo  ----------------------------------------------

REM "Making it Default printer (ถ้าจะใช้งานลบ comment(REM)หน้า CSCRIPT ออก) "

REM CSCRIPT %windir%\system32\Printing_Admin_Scripts\en-US\prnmngr.vbs -p "%varName%" -t

@pause