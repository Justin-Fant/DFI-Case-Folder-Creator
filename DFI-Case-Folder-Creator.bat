@echo off
title DFI Case Folder Creator
color 0a
echo.
echo =====================================================
echo      DFI Case Folder Creator
echo =====================================================
echo.

:: === AUTOMATIC DEFAULT: folder where THIS .bat file is located ===
set "SCRIPT_DIR=%~dp0"
set "DEFAULT_BASEPATH=%SCRIPT_DIR%"

echo Default base path is the location of this script:
echo %DEFAULT_BASEPATH%
echo.

:: Ask for case name
set /p "CASENAME=Enter Case Name (example: 2601-0001): "

if "%CASENAME%"=="" (
    echo.
    echo ERROR: Case name cannot be empty!
    pause
    exit /b
)

:: Ask for base path - just press Enter to use the default
set "BASEPATH=%DEFAULT_BASEPATH%"
set /p "BASEPATH=Base path for cases [Enter for default above]: " || set "BASEPATH=%DEFAULT_BASEPATH%"

:: Build full path safely
if "%BASEPATH:~-1%"=="\" (
    set "FULLPATH=%BASEPATH%%CASENAME%"
) else (
    set "FULLPATH=%BASEPATH%\%CASENAME%"
)

:: Check if folder already exists
if exist "%FULLPATH%" (
    echo.
    echo WARNING: Folder "%CASENAME%" already exists!
    set /p "CONTINUE=Continue anyway? (Y/N): "
    if /i not "%CONTINUE%"=="Y" exit /b
)

echo.
echo Creating professional case structure at:
echo %FULLPATH%
echo.

:: Create all folders
md "%FULLPATH%\01_Raw_Evidence" 2>nul
md "%FULLPATH%\02_Analysis" 2>nul
md "%FULLPATH%\03_Reports" 2>nul
md "%FULLPATH%\04_Exports\Carved_Images" 2>nul
md "%FULLPATH%\04_Exports\Carved_Videos" 2>nul
md "%FULLPATH%\04_Exports\Documents" 2>nul
md "%FULLPATH%\04_Exports\Chat_Exports" 2>nul
md "%FULLPATH%\04_Exports\Media" 2>nul
md "%FULLPATH%\05_Notes_Documents" 2>nul
md "%FULLPATH%\06_Hashes_Verification" 2>nul
md "%FULLPATH%\99_Archive" 2>nul

:: Create helpful placeholder files
echo Case: %CASENAME% > "%FULLPATH%\01_Raw_Evidence\Hashes.txt"
echo Initial hash verification will go here... >> "%FULLPATH%\01_Raw_Evidence\Hashes.txt"
echo. >> "%FULLPATH%\01_Raw_Evidence\Hashes.txt"
echo MD5: >> "%FULLPATH%\01_Raw_Evidence\Hashes.txt"
echo SHA-256: >> "%FULLPATH%\01_Raw_Evidence\Hashes.txt"

echo Examiner Notes - %CASENAME% > "%FULLPATH%\05_Notes_Documents\Examiner_Notes.txt"
echo Date: >> "%FULLPATH%\05_Notes_Documents\Examiner_Notes.txt"
echo Notes: >> "%FULLPATH%\05_Notes_Documents\Examiner_Notes.txt"

echo Final case package will be stored here > "%FULLPATH%\99_Archive\ReadMe_Archive.txt"

echo.
echo ✅ SUCCESS! Case folder structure created.
echo Location: %FULLPATH%
echo.

:: Open the folder
explorer "%FULLPATH%"

pause