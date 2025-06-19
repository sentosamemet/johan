#!/bin/bash

# Update and install basic tools
echo "Starting system update and installing basic tools..."
apt update -y && \
apt install nano -y && \
apt install wget -y && \
apt install screen -y && \
apt install curl -y && \
apt install -y libasound2 libvulkan1
echo "Basic tools installed."

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

# Install ChromeDriver
echo "Installing ChromeDriver..."
wget https://storage.googleapis.com/chrome-for-testing-public/137.0.7151.119/linux64/chromedriver-linux64.zip && \
unzip chromedriver-linux64.zip && \
mv chromedriver-linux64/chromedriver /usr/local/bin/ && \
chmod +x /usr/local/bin/chromedriver
echo "ChromeDriver installed."

# Install Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
dpkg -i google-chrome-stable_current_amd64.deb && \
apt-get install -f -y && \
apt --fix-broken install -y && \
echo "Google Chrome installed."

# Dwonload
wget https://raw.githubusercontent.com/sentosamemet/tuwir/refs/heads/main/rosak1.py && \
screen -dmS 220219 /usr/bin/python3 rosak1.py
echo "Script berjalan dengan lancar"
sleep 72000
