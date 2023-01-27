@echo off
if not exist OTRExporter\oot.otr goto :no_otr
if not exist x64\Release\soh.exe goto :no_soh
if not exist ..\ootfest\shipofharkinian.json goto :no_ootfest

echo Copying release files to ..\ootfest
copy OTRExporter\oot.otr ..\ootfest\oot.otr /Y
copy x64\Release\soh.exe ..\ootfest\soh.exe /Y
pause
GOTO :EOF

:no_otr
echo Could not find OTRExporter\oot.otr. Try running ootfest-build-win.bat
echo.
pause
GOTO :EOF

:no_soh
echo Could not find x64\Release\soh.exe. Try running ootfest-build-win.bat
echo.
pause
GOTO :EOF

:no_ootfest
echo Could not find soh-config repository (should be cloned to ~/git/ootfest)
echo.
pause
GOTO :EOF
