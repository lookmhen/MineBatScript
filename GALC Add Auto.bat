@echo off


REM ╔════════════════════════════════════ ∘◦ ❉∘◦ ConFig Zone ❉ ◦∘ ◦∘ ═════════════════════════════════════════╗

rem แก้ที่อยู่ certfile
set certfile=\\dmit18101\G4G-AY GALC\galc_key.cer

rem แก้ที่อยู่ exceptionlist
set exceptionlistfile=\\dmit18101\G4G-AY GALC\Exceptionlist\exception.sites

rem ***** แก้เมื่อมีการเปลี่ยนลิ้งเท่านั้น *****
set linkgalc=http://pdd.mydomain.com/servlet/jws/LineClient/LineClient.jnlp

rem ที่อยู่ไฟล์ที่ดาวโหลดมา
set galcsavelocation=d:\galc.jnlp

REM ╚═════════════════════════════════════ ∘◦ ❉∘◦ ConFig Zone ❉ ◦∘ ◦∘ ════════════════════════════════════════╝




rem ------------------------------------- scritptzone ---------------------------------------------------------




rem No check version out of date expire (popup ที่ให้ติ๊ก Later ตอนเปิดโปรแกรมครั้งแรก)
javaws -userConfig deployment.expiration.check.enabled false


rem set format date (dd-MMM-yy) ตั้งค่าวันที่เป็น Formate dd-MMM-yy
echo y | reg add "HKCU\Control Panel\International" /V sShortDate /T REG_SZ /D dd-MMM-yy



rem Add cert galc to Root & Publisher-------------

echo **********Add Cert Galac*********
certutil -addstore "TrustedPublisher" "%certfile%"
certutil -addstore "root" "%certfile%"

rem Add cert galc to Root & Publisher-------------


rem Download GALC from link and start -------------

echo **********Download galc*********
curl.exe --output %galcsavelocation% --url %linkgalc%

echo **********Start GALC*********
start %galcsavelocation%

rem Download GALC from link and start-------------


rem copy exception file to all users-------------

echo **********Add exceptionlist all users*********
for /f "tokens=*" %%A in ('dir/b c:\users\*.*') do (
echo y | xcopy "%exceptionlistfile%" "C:\Users\%%A\AppData\LocalLow\Sun\Java\Deployment\security\"
)

rem copy exception file to all users-------------



rem run viewer for create shortcut desktop-------------

echo **********Create Shortcut GALC*********
cmd /c "javaws -viewer"

rem run viewer for create shortcut desktop-------------

@pause