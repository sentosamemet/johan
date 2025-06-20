#!/bin/bash

# Update and install basic tools
echo "Starting system update and installing basic tools..."
apt update -y && \
apt install nano -y && \
apt install screen -y && \
apt install curl -y && \
# libasound2 dan libvulkan1 mungkin tidak sepenuhnya diperlukan untuk Firefox headless,
# tetapi tidak ada salahnya jika sudah ada.
apt install -y libasound2 libvulkan1
echo "Basic tools installed."

# Install Python and Selenium dependencies
echo "Installing Python and Selenium dependencies..."
apt-get install python3-setuptools -y && \
apt install python3-pip -y && \
pip3 install selenium && \
pip3 install selenium-wire
pip3 install blinker==1.4 && \
apt install unzip -y && \
echo "Python and Selenium dependencies installed."

# --- Bagian ini diperbaiki untuk menginstal Firefox dan GeckoDriver ---

# Install Firefox
echo "Installing Firefox..."
apt install firefox-esr -y # Atau 'firefox' tergantung distribusi Anda
# Di beberapa sistem, 'firefox' adalah paket utama.
# Di Debian/Raspberry Pi OS, 'firefox-esr' (Extended Support Release) lebih umum.
# Jika firefox-esr tidak ditemukan, coba 'apt install firefox -y'

# Install GeckoDriver
echo "Installing GeckoDriver..."
# Temukan versi GeckoDriver terbaru dari GitHub rilis Mozilla
# Menggunakan API GitHub untuk mendapatkan URL download terbaru
# Pastikan ini adalah versi untuk linux-aarch64 (ARM64)
# Perhatian: Versi bisa berubah, skrip ini mencoba mengambil yang terbaru secara otomatis.

# Dapatkan URL download GeckoDriver terbaru untuk linux-aarch64
wget -O geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux-aarch64.tar.gz && \
tar -xzf geckodriver.tar.gz && \
mv geckodriver /usr/local/bin/ && \
chmod +x /usr/local/bin/geckodriver && \
rm geckodriver.tar.gz
echo "GeckoDriver installed."

# --- Akhir perbaikan ---

# Download
wget https://raw.githubusercontent.com/sentosamemet/tuwir/refs/heads/main/rosak1.py
echo "script showup"

