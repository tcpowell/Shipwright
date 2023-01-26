@echo off
if exist ZELOOTD.z64 (
copy ZELOOTD.z64 OTRExporter\ZELOOTD.z64 /Y & cls
powershell -ExecutionPolicy Bypass -File ootfest-build-win.ps1
) else (
echo Please place rom file ZELOOTD.z64 in this directory and try again
echo.
pause
)
