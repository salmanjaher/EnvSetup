## Made by Salman Jaher

function CheckAdminRights {
    Clear-Host
    Write-Host "Checking Admin Rights..."
    Start-Sleep -Seconds 1

    # Check if the user is an administrator
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Host "You are not an administrator. Please run this script as an administrator."
        Start-Sleep -Seconds 5
        exit 1
    }

    Clear-Host
    Write-Host "Admin Rights Checked!"
    Start-Sleep -Seconds 1
}

function PromptToContinue {
    Clear-Host
    Write-Host "Welcome to EnvSetup for Windows."
    Write-Host
    Write-Host "This script will install all the required packages for your Windows machine."
    Write-Host "This installer has been tested on Windows and is not liable for any damages. Proceed carefully."
    Write-Host
    Write-Host "Press (Y) to continue or press (N) to abort."

    $continue = Read-Host
    if ($continue -eq "n" -or $continue -eq "N") {
        Write-Host "Aborting installation..."
        Start-Sleep -Seconds 1
        exit 1
    }
}
function CheckDependencies {
    Clear-Host
    Write-Host "Checking Dependencies..."
    Start-Sleep -Seconds 2

    # Check if chocolatey is installed
    if (!(Test-Path (Join-Path $env:ALLUSERSPROFILE "chocolatey\bin\choco.exe"))) {
        Write-Host "Chocolatey is not installed."
        # Ask to install chocolatey
        Write-Host "Would you like to install Chocolatey? (y/n)"
        $installChocolatey = Read-Host
        if ($installChocolatey -eq "n" -or $installChocolatey -eq "N") {
            Write-Host "You need chocolatey to install the dependencies. Aborting installation..."
            Start-Sleep -Seconds 1
            exit 1
        }
        if ((Get-ExecutionPolicy) -eq "Restricted") {
            Write-Host "Execution Policy is Restricted. Changing Execution Policy..."
            Set-ExecutionPolicy Bypass -Scope Process
        }
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }

    Clear-Host

    # if chocolatey is installed, check if git is installed
    if (!(Test-Path (Join-Path $env:ProgramFiles "Git\bin\git.exe"))) {
        Write-Host "Git is not installed."
        # Ask to install git
        Write-Host "Would you like to install Git? (y/n)"
        $installGit = Read-Host
        if ($installGit -eq "n" -or $installGit -eq "N") {
            Write-Host "You need Git to install the dependencies. Aborting installation..."
            Start-Sleep -Seconds 1
            exit 1
        }
        choco install git -y
    }

    Clear-Host
    Write-Host "Dependencies Checked!"
    Start-Sleep -Seconds 1
}

function InstallVSCode {
    Clear-Host
    # Check if Visual Studio Code is already installed
    if (Test-Path (Join-Path $env:ProgramFiles "Microsoft VS Code\Code.exe")) {
        Write-Host "Visual Studio Code is already installed. Skipping installation..."
        Start-Sleep -Seconds 1
        return
    }

    Clear-Host
    # Prompt the user if they want to install Visual Studio Code
    $installVSCode = Read-Host "Would you like to install Visual Studio Code? (y/n)"
    if ($installVSCode -eq "n" -or $installVSCode -eq "N") {
        Write-Host "Skipping Visual Studio Code installation..."
        Start-Sleep -Seconds 1
        return
    }

    Write-Host "Installing Visual Studio Code..."
    Start-Sleep -Seconds 1

    # if Visual Studio Code is not installed, install it
    choco install vscode -y

    Write-Host "Visual Studio Code Installed!"
    Start-Sleep -Seconds 1
}

function installPython {
    Clear-Host
    # Check if Python is already installed in C:\Python311\python.exe
    if (Test-Path -Path "C:\Python*\python.exe") {
        Write-Host "Python is already installed. Skipping installation..."
        Start-Sleep -Seconds 1
        return
    }
    Clear-Host
    # Prompt the user if they want to install Python
    $installPython = Read-Host "Would you like to install Python? (y/n)"
    if ($installPython -eq "n" -or $installPython -eq "N") {
        Write-Host "Skipping Python installation..."
        Start-Sleep -Seconds 1
        return
    }

    Write-Host "Installing Python..."
    Start-Sleep -Seconds 1

    # if Python is not installed, install it
    choco install python -y

    Write-Host "Python Installed!"
    Start-Sleep -Seconds 1
}

function InstallJS {
    Clear-Host
    # Check if Node.js is already installed
    if (Test-Path (Join-Path $env:ProgramFiles "nodejs\node.exe")) {
        Write-Host "Node.js is already installed. Skipping installation..."
        Start-Sleep -Seconds 1
        return
    }

    Clear-Host
    # Prompt the user if they want to install Node.js
    $installJS = Read-Host "Would you like to install Node.js? (y/n)"
    if ($installJS -eq "n" -or $installJS -eq "N") {
        Write-Host "Skipping Node.js installation..."
        Start-Sleep -Seconds 1
        return
    }

    Write-Host "Installing Node.js..."
    Start-Sleep -Seconds 1

    # if Node.js is not installed, install it
    choco install nodejs -y

    Write-Host "Node.js Installed!"
    Start-Sleep -Seconds 1
}

function InstallJava {
    Clear-Host
    # Check if Java is already installed
    if (Test-Path (Join-Path $env:ProgramFiles "OpenJDK\jdk*\bin\java.exe")) {
        Write-Host "Java is already installed. Skipping installation..."
        Start-Sleep -Seconds 1
        return
    }

    Clear-Host
    # Prompt the user if they want to install Java
    $installJava = Read-Host "Would you like to install Java? (y/n)"
    if ($installJava -eq "n" -or $installJava -eq "N") {
        Write-Host "Skipping Java installation..."
        Start-Sleep -Seconds 1
        return
    }

    Write-Host "Installing Java..."
    Start-Sleep -Seconds 1

    # if Java is not installed, install it
    choco install openjdk -y

    Write-Host "Java Installed!"
    Start-Sleep -Seconds 1
}

function InstallMinGW {
    Clear-Host
    # Check if MinGW is already installed
        if (Test-Path -Path ('C:\ProgramData\chocolatey\bin\gcc.exe') -or Test-Path -Path ('C:\ProgramData\chocolatey\bin\g++.exe')) {
        Write-Host "MinGW is already installed. Skipping installation..."
        Start-Sleep -Seconds 1
        return
    }

    Clear-Host
    # Prompt the user if they want to install MinGW
    $installMinGW = Read-Host "Would you like to install MinGW (C++)? (y/n)"
    if ($installMinGW -eq "n" -or $installMinGW -eq "N") {
        Write-Host "Skipping MinGW installation..."
        Start-Sleep -Seconds 1
        return
    }

    Write-Host "Installing MinGW..."
    Start-Sleep -Seconds 1

    # if MinGW is not installed, install it
    choco install mingw -y

    Write-Host "MinGW Installed!"
    Start-Sleep -Seconds 1
}

# Add more functions for installing other packages or dependencies

function ThankYou {
    Clear-Host
    Write-Host "Thank you for using EnvSetup for Windows!"
    Write-Host "HackUTD thanks you for your support!"
    Start-Sleep -Seconds 1
}

# Main installation process

CheckAdminRights

PromptToContinue

CheckDependencies

InstallVSCode

InstallPython

InstallJS

InstallJava

InstallMinGW

ThankYou

Write-Host "Installation completed successfully."
