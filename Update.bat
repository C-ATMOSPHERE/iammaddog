@echo off
setlocal

set CURRENT_DIR=%cd%
set DOWNLOAD_URL=https://iammaddog.ru/deadlock
set ZIP_FILENAME=update.zip
set EXTRACTION_PATH=%CURRENT_DIR%
set ZIP_PASSWORD=666


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
curl.exe -L "%DOWNLOAD_URL%" --output "%ZIP_FILENAME%"
if errorlevel 1 (
    echo Error: Failed to download the file.
    exit /b 1
)
echo Download complete. File saved as %ZIP_FILENAME%.



if exist "C:\Program Files\7-Zip\7z.exe" (
    echo 7-Zip found. Extracting with 7-Zip...
    "C:\Program Files\7-Zip\7z.exe" x -p%ZIP_PASSWORD% -y -o"%EXTRACTION_PATH%" "%ZIP_FILENAME%" -aoa
    if errorlevel 1 (
        echo Error: Failed to extract the zip file using 7-Zip. Aborting.
        exit /b 1
    )
) else (
    echo 7-Zip not found. Extracting with PowerShell...
    powershell -Command "Expand-Archive -Path '%ZIP_FILENAME%' -DestinationPath '%EXTRACTION_PATH%' -Force"
    if errorlevel 1 (
        echo Error: Failed to extract the zip file using PowerShell. Aborting.
        exit /b 1
    )
)
echo Extraction complete.



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
