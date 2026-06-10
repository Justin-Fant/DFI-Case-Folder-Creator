@echo off
title DFI Case Folder Creator v2.0
color 0a
echo.
echo =====================================================
echo      DFI Case Folder Creator v2.0
echo      Configurable Professional Structure
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

:: === FOLDER CREATION (Configurable via case_structure.txt) ===
set "STRUCTURE_FILE=%SCRIPT_DIR%case_structure.txt"

if exist "%STRUCTURE_FILE%" (
    echo Using custom folder structure from case_structure.txt ...
    for /f "usebackq tokens=* delims=" %%F in ("%STRUCTURE_FILE%") do (
        echo   + %%F
        md "%FULLPATH%\%%F" 2^>nul
    )
) else (
    echo Using default professional structure ...
    md "%FULLPATH%\00_Case_Information" 2^>nul
    md "%FULLPATH%\01_Raw_Evidence" 2^>nul
    md "%FULLPATH%\01_Raw_Evidence\Acquisition_Logs" 2^>nul
    md "%FULLPATH%\02_Analysis" 2^>nul
    md "%FULLPATH%\03_Reports" 2^>nul
    md "%FULLPATH%\04_Exports" 2^>nul
    md "%FULLPATH%\04_Exports\Carved_Images" 2^>nul
    md "%FULLPATH%\04_Exports\Carved_Videos" 2^>nul
    md "%FULLPATH%\04_Exports\Documents" 2^>nul
    md "%FULLPATH%\04_Exports\Chat_Exports" 2^>nul
    md "%FULLPATH%\04_Exports\Media" 2^>nul
    md "%FULLPATH%\05_Notes_Documents" 2^>nul
    md "%FULLPATH%\05_Notes_Documents\Examiner_Notes" 2^>nul
    md "%FULLPATH%\06_Hashes_Verification" 2^>nul
    md "%FULLPATH%\07_Chain_of_Custody" 2^>nul
    md "%FULLPATH%\08_Images" 2^>nul
    md "%FULLPATH%\09_Timeline" 2^>nul
    md "%FULLPATH%\99_Archive" 2^>nul
)

:: === CREATE IMPROVED PLACEHOLDER FILES + TEMPLATES ===
echo.
echo Creating enhanced placeholder templates...

:: Hashes.txt - improved structured template
(
echo Case: %CASENAME%
echo Created: %date% %time% by DFI Case Folder Creator v2.0
echo Examiner: 
echo.
echo ============================================
echo ACQUISITION HASHES
echo ============================================
echo MD5: 
echo SHA-256: 
echo SHA-1: 
echo.
echo ============================================
echo VERIFICATION / RE-HASH LOG
echo ============================================
echo Date/Time          ^| Action                  ^| Hash Type ^| Value                              ^| Examiner
echo ----------------------------------------------------------------------------------------------------
) > "%FULLPATH%\01_Raw_Evidence\Hashes.txt"

:: Examiner_Notes.txt - improved professional template
(
echo Case: %CASENAME%
echo Examiner Notes
echo Created: %date% %time%
echo.
echo ============================================
echo CASE SUMMARY / INTAKE
echo ============================================
echo Date Received: 
echo Submitting Agency: 
echo Contact: 
echo.
echo Devices / Evidence Received:
echo - 
echo.
echo ============================================
echo ACTIONS TAKEN / EXAMINATION LOG
echo ============================================
echo Date       ^| Time ^| Action / Step                          ^| Examiner ^| Notes / Observations
echo ------------------------------------------------------------------------------------------
echo.
echo ============================================
echo KEY FINDINGS / OBSERVATIONS
echo ============================================
echo.
echo.
echo ============================================
echo NEXT STEPS / PENDING ITEMS
echo ============================================
echo.
) > "%FULLPATH%\05_Notes_Documents\Examiner_Notes.txt"

:: Case_Manifest.txt - NEW professional summary file at case root
(
echo =====================================================
echo DFI CASE FOLDER MANIFEST
echo Professional Digital Forensics Case Structure v2.0
echo =====================================================
echo.
echo Case Name          : %CASENAME%
echo Created On         : %date% %time%
echo Created With       : DFI Case Folder Creator v2.0
echo Script Location    : %SCRIPT_DIR%
echo Full Path          : %FULLPATH%
echo.
echo =====================================================
echo FOLDER STRUCTURE CREATED
echo =====================================================
echo 00_Case_Information          - Case metadata, intake, authorization
echo 01_Raw_Evidence              - Original evidence + acquisition artifacts
echo   \Acquisition_Logs          - Acquisition documentation
echo 02_Analysis                  - Analysis workspace
echo 03_Reports                   - Final reports and deliverables
echo 04_Exports                   - Exported / carved data
echo   \Carved_Images
echo   \Carved_Videos
echo   \Documents
echo   \Chat_Exports
echo   \Media
echo 05_Notes_Documents           - Examiner notes and documentation
echo   \Examiner_Notes
echo 06_Hashes_Verification       - Hash logs and verification
echo 07_Chain_of_Custody          - CoC forms and transfer logs
echo 08_Images                    - Photographs (scene, devices, evidence)
echo 09_Timeline                  - Timeline artifacts and analysis
echo 99_Archive                   - Final archived package
echo.
echo =====================================================
echo KEY PLACEHOLDER FILES
echo =====================================================
echo - 01_Raw_Evidence\Hashes.txt
echo - 05_Notes_Documents\Examiner_Notes.txt
echo - Case_Manifest.txt (this file)
echo.
echo =====================================================
echo RECOMMENDED NEXT STEPS
echo =====================================================
echo 1. Copy/move raw evidence files into 01_Raw_Evidence\
echo 2. Document acquisition details and hashes in Hashes.txt
echo 3. Record device photos in 08_Images\
echo 4. Maintain detailed notes in Examiner_Notes.txt
echo 5. Track all transfers in 07_Chain_of_Custody\
echo 6. Use 09_Timeline for temporal analysis
echo 7. Archive final deliverables in 99_Archive\
echo.
echo This structure follows SWGDE / NIST digital forensics best practices.
echo.
echo =====================================================
echo                  END OF MANIFEST
echo =====================================================
) > "%FULLPATH%\Case_Manifest.txt"

echo.
echo ✅ SUCCESS! Professional case folder structure created.
echo Location: %FULLPATH%
echo.
echo A Case_Manifest.txt has been created with full details and next steps.
echo.

:: Open the folder
explorer "%FULLPATH%"

pause