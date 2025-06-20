#!/bin/bash

# Update and install basic tools
echo "Starting system update and installing basic tools..."
apt update -y && \
apt install nano -y && \
apt install screen -y && \
apt install curl -y && \
apt install -y libasound2 libvulkan1
echo "Basic tools installed."

# Ensure 'universe' repository is enabled (common for Chromium/Firefox)
echo "Ensuring 'universe' repository is enabled..."
apt install software-properties-common -y || { echo "Failed to install software-properties-common. Exiting."; exit 1; }
add-apt-repository universe -y || { echo "Failed to add universe repository. Exiting."; exit 1; }
apt update -y || { echo "Failed to update apt cache after adding universe. Exiting."; exit 1; }
echo "Universe repository enabled and apt cache updated."

# Install Python venv for creating virtual environments
echo "Installing python3-venv..."
apt install python3-venv -y || { echo "Failed to install python3-venv. Exiting."; exit 1; }
echo "python3-venv installed."

# --- Bagian ini diperbaiki untuk menginstal Firefox dan GeckoDriver ---

# Install Firefox
echo "Installing Firefox..."
apt install firefox-esr -y || apt install firefox -y || { echo "Failed to install Firefox. Exiting."; exit 1; }
echo "Firefox installed."

# Install GeckoDriver
echo "Installing GeckoDriver..."
# Anda dapat menggunakan cara otomatis atau versi spesifik seperti yang Anda preferensikan
# Contoh menggunakan versi spesifik v0.36.0 (pastikan ini adalah yang Anda inginkan)
wget -O geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux-aarch64.tar.gz && \
tar -xzf geckodriver.tar.gz && \
mv geckodriver /usr/local/bin/ && \
chmod +x /usr/local/bin/geckodriver && \
rm geckodriver.tar.gz
echo "GeckoDriver installed."

# --- MENGGUNAKAN VIRTUAL ENVIRONMENT UNTUK INSTALASI PAKET PYTHON ---
echo "Creating and activating Python virtual environment..."
VENV_DIR="$HOME/rosak_venv" # Lokasi virtual environment
python3 -m venv "$VENV_DIR" || { echo "Failed to create virtual environment. Exiting."; exit 1; }

# Aktifkan virtual environment untuk sesi skrip ini
source "$VENV_DIR/bin/activate" || { echo "Failed to activate virtual environment. Exiting."; exit 1; }
echo "Virtual environment activated."

# Install Python and Selenium dependencies INSIDE THE VIRTUAL ENVIRONMENT
echo "Installing Python and Selenium dependencies inside virtual environment..."
pip install --upgrade pip || { echo "Failed to upgrade pip. Exiting."; exit 1; }
pip install selenium || { echo "Failed to install selenium. Exiting."; exit 1; }
pip install selenium-wire || { echo "Failed to install selenium-wire. Exiting."; exit 1; }
pip install blinker==1.4 || { echo "Failed to install blinker. Exiting."; exit 1; }
echo "Python and Selenium dependencies installed in virtual environment."

# --- Akhir perbaikan virtual environment ---

# Download Python script and run it using the virtual environment's python
echo "Downloading and running Python script..."
wget https://raw.githubusercontent.com/sentosamemet/tuwir/refs/heads/main/rosak1.py || { echo "Failed to download rosak1.py. Exiting."; exit 1; }

# Jalankan skrip Python menggunakan interpreter dari virtual environment
screen -dmS 220219 python rosak1.py # Gunakan 'python' karena venv sudah aktif
echo "Script berjalan dengan lancar"
sleep 72000

# Opsional: Menonaktifkan virtual environment setelah selesai (tidak diperlukan di screen)
# deactivate
