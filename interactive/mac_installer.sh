#!/bin/bash
## Made by Salman Jaher
prompt_to_continue() {
  clear
  echo "Welcome to EnvSetup for MacOS. "
  echo
  echo "This script will install all the required packages for your Mac."
  echo "This installer has been tested on both Intel and Apple Silicone, and is not liable for any damages. Proceed carefully."
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

detect_mac_type() {
  # Detect the user's Mac type
  if [[ $(uname -m) == "arm64" ]]; then
    mac_type="2"
    mac_type_name="M1/M2 Mac"
  else
    mac_type="1"
    mac_type_name="Intel-Based Mac"
  fi
}


manual_switch_mac_type() {
 clear
 echo "We detected that you are using an $mac_type_name. "
 echo
 echo "If this is correct press enter, otherwise press N to switch."
 read -rsn1 key
 if [[ $key == "n" || $key == "N" ]]; then
   prompt_for_mac_type
 fi
}

verify_mac_type() {
  clear
  echo "Verifying Mac Type..."
  sleep 1
  # Check if the user's Mac type matches the current Mac type
  if [[ $mac_type == "1" && $(uname -m) == "arm64" ]]; then
    echo "You are using an M1/M2 Mac. Please select the correct option."
    sleep 2
    prompt_for_mac_type
    verify_mac_type
  elif [[ $mac_type == "2" && $(uname -m) != "arm64" ]]; then
    echo "You are using an Intel-based Mac. Please select the correct option."
    sleep 2
    prompt_for_mac_type
    verify_mac_type
  fi

  clear
  echo "Mac Type Verified!"
  sleep 1
}

prompt_for_mac_type() {
  clear
  echo "Please select your Mac type:"
  echo "1. Intel Based Mac"
  echo "2. M1/M2 Mac"
  sleep 1
  
  # Disable echoing input
  stty -echo
  read -n 1 -r mac_type
  stty echo
  
  echo
  
  # Validate the user's choice
  while [[ $mac_type != "1" && $mac_type != "2" ]]; do
    echo "Invalid input. Please enter 1 or 2."
    stty -echo
    read -n 1 -r mac_type
    stty echo
    echo
  done

  clear
  if [[ $mac_type == "1" ]]; then
    mac_type_name="Intel-Based Mac"
  else
    mac_type_name="M1/M2 Mac"
  fi
  echo "Mac Type Selected:  $mac_type_name"
  sleep 2
}

check_dependencies() {
  clear
  echo "Checking Dependencies..."
  sleep 1
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  
  # Check if Git is installed
  if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    brew install git
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
  brew install --cask visual-studio-code
  echo "Visual Studio Code Installed!"
  sleep 1
}

install_python() {
 clear
  # check if python is installed
  if command -v python &> /dev/null; then
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
  brew install python
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
  brew install node
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
  brew install java
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
  brew install c++
  echo "C++ Installed!"
  sleep 1
 }

 thank_you() {
  clear
  echo "Thank you for using EnvSetup for MacOS!"
  echo "HackUTD thanks you for your support!"
  sleep 1
 }


prompt_to_continue

detect_mac_type

manual_switch_mac_type

verify_mac_type

check_dependencies

install_vscode

install_python

install_js

install_java

install_c++

thank_you

echo "Installation completed successfully."

exit 0
