# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator!"
    Break
}

# Function to check installation and install if necessary
function Install-IfNotPresent {
    param (
        [string]$pathToCheck,
        [string]$installCommand,
        [string]$appName
    )

    if (!(Test-Path $pathToCheck)) {
        Write-Output "Installing $appName..."
        Invoke-Expression $installCommand
    } else {
        Write-Output "$appName is already installed."
    }
}

# Install Chocolatey if not already installed
$chocoPath = "$env:ProgramData\chocolatey\choco.exe"
Install-IfNotPresent $chocoPath "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" "Chocolatey"

# Install VS Code if not already installed
$vscodePath = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe"
Install-IfNotPresent $vscodePath "choco install vscode -y" "Visual Studio Code"

# Install Python if not already installed
$pythonPath = "$env:LOCALAPPDATA\Programs\Python\Python*"
Install-IfNotPresent $pythonPath "choco install python -y" "Python"

# Refresh environment variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Function to add Python to environment variables
function Add-PythonToPath {
    $pythonInstallPath = [System.IO.Path]::GetDirectoryName((Get-Command python).Source)
    
    if (-not ($env:Path -like "*$pythonInstallPath*")) {
        [System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";$pythonInstallPath", [System.EnvironmentVariableTarget]::Machine)
        Write-Output "Added Python to the system environment variables."
    } else {
        Write-Output "Python is already in the system environment variables."
    }
}

Add-PythonToPath

# Install VS Code extensions
Write-Output "Installing VS Code extensions..."
$extensions = @(
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-python.python-snippets-3",
    "dracula-theme.theme-dracula",
    "github-theme.github-vscode-theme",
    "PKief.material-icon-theme",
    "be5invis.vscode-icontheme-nomo-dark",
    "enkia.tokyo-night",
    "mariana-midnight.marianamidnight",
    "anderseandersen.mid-nigth",
    "GitHub.vscode-pull-request-github",
    "GitHub.copilot",
    "GitHub.copilot-chat",
    "gitkraken.gitkraken-gitlens",
    "visualstudioexptteam.vscodeintellicode",
    "MS-vsliveshare.vsliveshare",
    "afractal.node-essentials",
    "christian-kohler.path-intellisense",
    "Wallaby.quokka-vscode",
    "ms-vscode-remote.remote-wsl",
    "redhat.vscode-yaml",
    "EditorConfig.EditorConfig",
    "dbaeumer.vscode-eslint",
    "ecmel.vscode-html-css",
    "wix.vscode-import-cost",
    "ritwickdey.LiveServer",
    "ms-vscode.live-server",
    "yzhang.markdown-all-in-one",
    "shd101wyy.markdown-preview-enhanced",
    "bierner.markdown-preview-github-styles",
    "DavidAnson.vscode-markdownlint",
    "mikestead.dotenv",
    "ChrisNoring.node-snippets",
    "orta.vscode-jest",
    "cweijan.vscode-mysql-client2",
    "ms-python.debugpy",
    "redhat.fabric8-analytics",
    "codeium.codeium"
)

foreach ($extension in $extensions) {
    Write-Output "Installing extension: $extension"
    code --install-extension $extension
}

# Install required Python packages
Write-Output "Installing Python packages..."
python -m pip install --upgrade pip
pip install pylint autopep8 pytest

Write-Output "Installation complete! Please restart your computer to ensure all changes take effect."