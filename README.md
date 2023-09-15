# Welcome to EnvSetup by HackUTD!

## Table of Contents

- [What is this?](#what-is-this)
- [Easy mode](#easy-mode)
  - [Interactive](#interactive)
    - [Mac](#mac)
    - [Windows](#windows)
    - [Linux](#linux)
- [Pro](#pro)
  - [Mac](#mac-1)
  - [Windows](#windows-1)
  - [Linux](#linux-1)

---

## What is this?

This tool was created to help you setup your environment for development. It will install the following languages:

- Python
- JavaScript (Node)
- Java
- C++

The following tools:

- Homebrew (Mac) / Chocolatey (Windows)
- Git
- VSCode

The Interactive mode will ask you which languages you want to install. It will also ask you if you want to install the tools. This is reccomended for beginners.

The Pro mode is for advanced users, who would like more freedom in what they want to install.

---

## Easy mode

### Interactive

#### Mac

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/salmanjaher/EnvSetup/main/interactive/mac_installer.sh)
```

#### Windows

Please run this in an elevated PowerShell prompt (Run as Administrator)

```ps1
iex (iwr -Uri 'https://raw.githubusercontent.com/salmanjaher/EnvSetup/main/interactive/windows_installer.ps1' -UseBasicParsing).Content
```

#### Linux

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/salmanjaher/EnvSetup/main/interactive/linux_installer.sh)
```

---

## Pro

### Mac

Homebrew is a package manager for Mac. It will allow you to install packages from the command line.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Git is a version control system. It will allow you to keep track of your code changes.

```bash
brew install git
```

VSCode is a code editor. It will allow you to write code.

```bash
brew install --cask visual-studio-code
```

Python is useful for many different coding applications, starting from basic web dev to complex ML.

```bash
brew install python
```

Node is a JavaScript runtime. It will allow you to run JavaScript code.

```bash
brew install node
```

Java is another basic programming language. Its not as easy to use as Python or Javascript, but it is very powerful.

```bash
brew install java
```

C++ is a low level programming language. It is very powerful, but also very difficult to use.

```bash
brew install gcc
```

### Windows

Chocolatey is a package manager for Windows. It will allow you to install packages from the command line.

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

Git is a version control system. It will allow you to keep track of your code changes.

```ps1
choco install git
```

VSCode is a code editor. It will allow you to write code.

```ps1
choco install vscode
```

Python is useful for many different coding applications, starting from basic web dev to complex ML.

```ps1
choco install python
```

Node is a JavaScript runtime. It will allow you to run JavaScript code.

```ps1
choco install nodejs
```

Java is another basic programming language. Its not as easy to use as Python or Javascript, but it is very powerful.

```ps1
choco install jdk8
```

C++ is a low level programming language. It is very powerful, but also very difficult to use.

```ps1
choco install mingw
```

### Linux

Git is a version control system. It will allow you to keep track of your code changes.

```bash
sudo apt install git
```

VSCode is a code editor. It will allow you to write code.

```bash
sudo snap install --classic code
```

Python is useful for many different coding applications, starting from basic web dev to complex ML.

```bash
sudo apt install python3
```

Node is a JavaScript runtime. It will allow you to run JavaScript code.

```bash
sudo apt install nodejs
```

Java is another basic programming language. Its not as easy to use as Python or Javascript, but it is very powerful.

```bash
sudo apt install default-jdk
```

C++ is a low level programming language. It is very powerful, but also very difficult to use.

```bash
sudo apt install build-essential
```
