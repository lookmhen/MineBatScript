@echo off
cls
color 0a
echo --------Computername----------
echo .
hostname
echo .
echo --------Computername----------

 
echo. 
echo.

echo --------SerailNUmber+Detail----------
echo .

wmic bios get serialnumber
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"

echo --------SerailNUmber+Detail----------


@pause