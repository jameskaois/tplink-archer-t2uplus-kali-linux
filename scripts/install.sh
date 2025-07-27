#!/bin/bash

# TP-Link Archer T2U Plus Auto Installer Script for Kali Linux
# Author: CyberSecBeginner

set -e

echo "📡 TP-Link Archer T2U Plus Driver Installer"
echo "==========================================="

# Step 1: Update System
echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install dependencies
echo "📦 Installing required packages..."
sudo apt install -y dkms git build-essential libelf-dev linux-headers-$(uname -r)

# Step 3: Clone the correct driver repo for MT7610U chipset
echo "🔻 Cloning driver repository..."
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au

# Step 4: Build and install the driver
echo "🔧 Building and installing the driver..."
sudo make dkms_install

# Step 6: Verify interface
echo "📡 Checking for Wi-Fi interface..."
iwconfig || echo "❗ 'iwconfig' not found. Try installing wireless-tools."

echo ""
echo "✅ Done! Your TP-Link Archer T2U Plus adapter should now be active."
echo "💡 Use 'iwconfig' or 'ip a' to verify the interface (usually wlan0)."
