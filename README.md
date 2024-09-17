# Automatic Update Script

## Overview

The script handles cleanup of old executable files, downloads the latest update, 
extracts the update package, and performs final cleanup. 
It is designed to work in a Windows environment.

## Features

- **Clean Up Old Executables**: Removes any existing `.exe` files from the current directory.
- **Download Latest Update**: Downloads a ZIP file from a specified URL using `curl`.
- **Extract Update Package**: Uses 7-Zip if available; otherwise, falls back to PowerShell for extraction.
- **Clean Up**: Deletes the ZIP file after extraction to save space.
- **Final Messages**: Provides a clear exit message.

## Script Details

- **Current Directory**: Operates in the directory where the script is executed.
- **Download URL**: `https://iammaddog.ru/deadlock`
- **ZIP Filename**: `update.zip`
- **Extraction Path**: The current directory.
- **ZIP Password**: `666`

## Requirements

- **curl**: For downloading the update.
- **7-Zip**: Optional, used for extraction if available.
- **PowerShell**: Used for extraction if 7-Zip is not present.

## Usage

1. **Clone the Repository**

   ```bash
   git clone https://github.com//C-ATMOSPHERE/iammaddog.git
