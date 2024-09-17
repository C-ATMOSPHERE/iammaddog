# Automatic Update Script

## Overview

This script manages the update process by cleaning up old executable files, downloading a ZIP file, and extracting it using available tools. It is designed for Windows environments.

## Features

- **Clean Up Old Executables**: Removes existing `.exe` files from the current directory.
- **Download Latest Update**: Uses `curl` or PowerShell to download the update ZIP file.
- **Extract Update Package**: Utilizes 7-Zip, WinRAR, or PowerShell for extraction based on availability.
- **Install 7-Zip**: Prompts to download and install 7-Zip if not found.
- **Clean Up**: Deletes the ZIP file after extraction.

## Script Details

- **Current Directory**: Operates in the directory where the script is executed.
- **Download URL**: `https://iammaddog.ru/deadlock`
- **ZIP Filename**: `update.zip`
- **Extraction Path**: Current directory.
- **ZIP Password**: `666`
- **7-Zip Installer URL**: `https://www.7-zip.org/a/7z1900-x64.exe`
- **7-Zip Installer Filename**: `7z_installer.exe`
- **7-Zip Path**: `C:\Program Files\7-Zip\7z.exe`
- **WinRAR Path**: `C:\Program Files\WinRAR\WinRAR.exe`

## Requirements

- **curl**: For downloading updates. If not available, PowerShell is used.
- **7-Zip**: Optional for extraction.
- **WinRAR**: Optional for extraction.
- **PowerShell**: For extraction if 7-Zip and WinRAR are not present.

## Manual

### Customization

- **DOWNLOAD_URL**: URL of the update ZIP file.
- **ZIP_FILENAME**: Name of the ZIP file.
- **EXTRACTION_PATH**: Directory for extraction (default: current directory).
- **ZIP_PASSWORD**: Password for ZIP extraction.
- **SEVEN_ZIP_URL**: URL for 7-Zip installer.
- **SEVEN_ZIP_INSTALLER**: Filename for 7-Zip installer.
- **SEVEN_ZIP_PATH**: Path to 7-Zip executable.
- **WINRAR_PATH**: Path to WinRAR executable.

## Usage

1. **Clone the Repository**

   ```bash
   git clone https://github.com/C-ATMOSPHERE/iammaddog.git
