#!/bin/bash
## Made by Salman Jaher

update() {
  sudo apt update
}

warning() {
  clear
  echo "This script will only work on apt-based systems such as ubuntu and debian." 
  echo "This script is not liable for any damages. Proceed carefully."
  echo "Press enter to continue or press ESC to abort."
  read -rsn1 key
  if [[ $key == $'\e' ]]; then
    echo "Installation aborted."
    exit 0
  fi
}

detect_linux_type() {
  # Check if the user is using an apt-based system
  if [[ $(command -v apt) == "" ]]; then
    echo "This script only works on apt-based systems such as Ubuntu and Debian."
    echo "Installation aborted."
    sleep 5
    exit 0
  fi
}

check_sudo_snap() {
  # Check if sudo and snap are installed
  if ! command -v sudo &> /dev/null; then
    echo "sudo is not installed. Installing sudo..."
    sleep 1
    apt install sudo
  fi
  if ! command -v snap &> /dev/null; then
    echo "snap is not installed. Installing snap..."
    sleep 1
    sudo apt install snapd
  fi
}

prompt_to_continue() {
  clear
  echo "Welcome to EnvSetup for Linux. "
  echo
  echo "This script will install all the required packages for Linux."
  echo "This installer has been tested on apt based systems, and is not liable for any damages. Proceed carefully."
  echo
  echo "Press enter to continue or press ESC to abort."
  
  # Read a single character from input without requiring Enter
  read -rsn1 key
  
  # Check if ESC key was pressed
  if [[ $key == $'\e' ]]; then
    echo "Installation aborted."
    exit 0
  fi
}

check_dependencies() {  
  # Check if Git is installed
  if command -v git &> /dev/null; then
    echo "Git is already installed. Skipping installation..."
    sleep 1
  else
    echo "Git is not installed. Installing..."
    sleep 1
    sudo apt install git
  fi

  clear
  echo "Dependencies Checked!"
  sleep 1
}

install_vscode() {
 # check if vscode is installed
 clear
 if command -v code &> /dev/null; then
   echo "Visual Studio Code is already installed. Skipping installation..."
   sleep 1
   return
 fi
 clear
 # prompt user if they would like to install vscode
 echo "Would you like to install Visual Studio Code? (y/n)"
 read -rsn1 key
 if [[ $key == "n" || $key == "N" ]]; then
   echo "Skipping Visual Studio Code installation..."
   sleep 1
   return
 fi
  echo "Installing Visual Studio Code..."
  sleep 1
  sudo snap install --classic code
  echo "Visual Studio Code Installed!"
  sleep 1
}

install_python() {
 clear
 # check if python is installed
 if command -v python3 &> /dev/null; then
   echo "Python is already installed. Skipping installation..."
   sleep 1
   return
 fi
 clear
 # prompt user if they would like to install python
 echo "Would you like to install Python? (y/n)"
 read -rsn1 key
 if [[ $key == "n" || $key == "N" ]]; then
   echo "Skipping Python installation..."
   sleep 1
   return
 fi
 echo "Installing Python..."
 sleep 1
 sudo apt install python3
 echo "Python Installed!"
 sleep 1
}


 install_js() {
  clear
  # check if node is installed
  if command -v node &> /dev/null; then
    echo "Node is already installed. Skipping installation..."
    sleep 1
    return
  fi
  clear
  # prompt user if they would like to install node
  echo "Would you like to install Node? (y/n)"
  read -rsn1 key
  if [[ $key == "n" || $key == "N" ]]; then
    echo "Skipping Node installation..."
    sleep 1
    return
  fi
  echo "Installing Node..."
  sleep 1
  sudo apt install nodejs
  echo "Node Installed!"
  sleep 1
 }

 install_java() {
  clear
  # check if java is installed
  if command -v java &> /dev/null; then
    echo "Java is already installed. Skipping installation..."
    sleep 1
    return
  fi
  clear
  # prompt user if they would like to install java
  
  echo "Would you like to install Java? (y/n)"
  read -rsn1 key
  if [[ $key == "n" || $key == "N" ]]; then
    echo "Skipping Java installation..."
    sleep 1
    return
  fi
  echo "Installing Java..."
  sleep 1
  sudo apt install default-jre
  echo "Java Installed!"
  sleep 1
 }

 install_c() {
  clear
  # check if c++ is installed
  if command -v c++ &> /dev/null; then
    echo "C++ is already installed. Skipping installation..."
    sleep 1
    return
  fi
  clear
  # prompt user if they would like to install c++
  echo "Would you like to install C++? (y/n)"
  read -rsn1 key
  if [[ $key == "n" || $key == "N" ]]; then
    echo "Skipping C++ installation..."
    sleep 1
    return
  fi
  echo "Installing C++..."
  sleep 1
  sudo apt install g++
  echo "C++ Installed!"
  sleep 1
 }

 thank_you() {
  clear
  echo "Thank you for using EnvSetup for Linux!"
  echo "HackUTD thanks you for your support!"
  sleep 1
 }



warning

detect_linux_type

prompt_to_continue

update

check_sudo_snap

check_dependencies

install_vscode

install_python

install_js

install_java

install_c++

thank_you

echo "Installation completed successfully."

exit 0
