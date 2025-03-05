@echo off
setlocal

:: Get the directory where this script is located
set "script_dir=%~dp0"
:: Remove trailing backslash
set "script_dir=%script_dir:~0,-1%"

:: Define the base build directory relative to script location
set build_path=%script_dir%\..\build\

:: Find the latest build folder by sorting directories by name (since they're datetime-based)
:: Skip the mods folder by adding a findstr filter
for /f "delims=" %%i in ('dir /b /ad /o-n "%build_path%" ^| findstr /v /i "^mods$"') do (
    set "latest_build=%%i"
    goto :found
)

:found
if not defined latest_build (
    echo No build folders found in %build_path%
    exit /b 1
)

set run_path_file=startup.console.exe
set full_path=%build_path%%latest_build%\%run_path_file%

:: Print debug information
echo Script directory: %script_dir%
echo Build path: %build_path%
echo Latest build folder: %latest_build%
echo Full path to executable: %full_path%

:: Check if the executable exists
if exist "%full_path%" (
    echo Running latest build from: %latest_build%
    cd /d "%build_path%%latest_build%"
    start "" "%full_path%"
) else (
    echo Executable not found in the latest build directory: %full_path%
)

endlocal 