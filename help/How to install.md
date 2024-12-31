# Development Environment Setup Guide

This guide explains how to run the development environment setup script (`setup_dev_environment.ps1`).

## Prerequisites

Before running the script, ensure that:
1. You have Windows 10/11 operating system
2. You have an active internet connection

## Installation Steps

1. **Open PowerShell as Administrator**
   - Right-click on the Windows Start button
   - Select "Windows PowerShell (Admin)" or "Windows Terminal (Admin)"
   - Click "Yes" when prompted by User Account Control (UAC)

2. **Navigate to the Script Location**
   ```powershell
   cd "C:\Users\Lama\Documents\Test App\tutorial"
   // Replace "C:\Users\Lama\Documents\Test App\tutorial" with the actual path to your script
   ```

3. **Enable Script Execution** (if not already enabled)
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

4. **Run the Setup Script**
   ```powershell
   .\setup_dev_environment.ps1
   ```

## What Will Be Installed

The script will automatically install and configure:
- Chocolatey (Package Manager)
- Visual Studio Code
- Python
- Various VS Code extensions for development
- Essential Python packages (pylint, autopep8, pytest)

## After Installation

1. Restart your computer to ensure all changes take effect
2. Open Visual Studio Code to verify the installation
3. The script will have set up Python in your system PATH automatically

## Troubleshooting

If you encounter any issues:
1. Ensure you're running PowerShell as Administrator
2. Check your internet connection
3. Make sure Windows Defender or antivirus isn't blocking the installation
4. Verify that the script path is correct

## Note

This script requires administrator privileges to:
- Install software packages
- Modify system PATH
- Install VS Code extensions globally