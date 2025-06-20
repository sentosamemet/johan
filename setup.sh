#!/bin/bash

# Update and install basic tools
echo "Starting system update and installing basic tools..."
apt update -y && \
apt install nano -y && \
apt install screen -y && \
apt install curl -y && \
apt install -y libasound2 libvulkan1
echo "Basic tools installed."

# --- TAMBAHKAN BARIS INI UNTUK MENGAKTIFKAN REPO UNIVERSE ---
echo "Ensuring 'universe' repository is enabled..."
apt install software-properties-common -y && \
add-apt-repository universe -y && \
apt update -y
echo "Universe repository enabled and apt cache updated."
# -----------------------------------------------------------

# Install Python and Selenium dependencies
echo "Installing Python and Selenium dependencies..."
apt-get install python3-setuptools -y && \
apt install python3-pip -y && \
pip install --upgrade pip -y && \
pip install selenium && \
pip install selenium-wire && \
pip install blinker==1.4 && \
apt install unzip -y && \
echo "Python and Selenium dependencies installed."

# Install Chromium-Browser (pengganti Google Chrome untuk ARM64)
echo "Installing Chromium-Browser for ARM64..."
apt install chromium-browser -y && \
apt install chromium-chromedriver -y
echo "Chromium-Browser and ChromeDriver for ARM64 installed."

# Download
wget https://raw.githubusercontent.com/sentosamemet/tuwir/refs/heads/main/rosak1.py && \
screen -dmS 220219 /usr/bin/python3 rosak1.py
echo "Script berjalan dengan lancar"
sleep 72000
