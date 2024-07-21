@echo off
setlocal enabledelayedexpansion

set "scriptName=%~nx0"
set "keepFolder=R6ANTIRECOIL"

for %%F in (*.*) do (
    if /I not "%%F" == "%scriptName%" del "%%F"
)

for /d %%D in (*) do (
    if /I not "%%D" == "%keepFolder%" rd /s /q "%%D"
)

if exist "%keepFolder%" (
    xcopy "%keepFolder%\*" . /s /e /y
    rd /s /q "%keepFolder%"
)

if exist "R6ANTIRECOIL.exe" (
    start "" "R6ANTIRECOIL.exe"
) else (
    echo R6ANTIRECOIL.exe not found!
)

endlocal
