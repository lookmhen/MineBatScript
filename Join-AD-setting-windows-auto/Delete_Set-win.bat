@echo off

rem ทำลายตัวเอง และ file ทั้งหมดที่อยู่ใน folder เดียวกัน
rd /s /q "%~dp0"

rem ทำลายตัวเอง
del "%~f0"

@pause