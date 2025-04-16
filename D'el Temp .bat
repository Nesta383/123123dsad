@echo off
echo กำลังลบไฟล์ Temp...

:: ลบไฟล์ใน Temp ของผู้ใช้ปัจจุบัน
del /q /f /s "%TEMP%\*.*"

:: ลบโฟลเดอร์ที่อยู่ใน Temp ของผู้ใช้ปัจจุบัน
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x"

:: ลบ Temp ทั่วไปของระบบ (ถ้ามีสิทธิ์ Admin)
del /q /f /s "C:\Windows\Temp\*.*"
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x"

echo -------------------------------------
echo กำลังลบแคช FiveM...
echo -------------------------------------

REM ไปยังโฟลเดอร์ Application Data ของ FiveM
cd /d %localappdata%\FiveM\FiveM.app

REM ตรวจสอบว่ามีโฟลเดอร์ cache หรือไม่
if exist cache (
    echo ลบโฟลเดอร์ cache ยกเว้นโฟลเดอร์ game...
    REM ลบทุกอย่างใน cache ยกเว้น game
    for /d %%i in (cache\*) do (
        if /i not "%%~nxi"=="game" (
            rd /s /q "%%i"
        )
    )
    echo ลบไฟล์ใน cache root...
    del /q cache\*
) else (
    echo ไม่พบโฟลเดอร์ cache
)

echo -------------------------------------
echo              Success
echo -------------------------------------
cls
