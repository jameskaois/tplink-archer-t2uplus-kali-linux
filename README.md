# 📡 TP-Link Archer T2U Plus on Kali Linux – Driver Installation Guide

> A personal project and guide by a cybersecurity enthusiast  
> to get the TP-Link Archer T2U Plus WiFi adapter working on Kali Linux.

<p align="center"><img src="./IMG_6363 2.png" alt="Archer T2U Plus" style="width:50%; height:auto;"></p>

---

## 🌐 About This Project

When I first got into ethical hacking and wireless security, I picked up a **TP-Link Archer T2U Plus** — it was affordable, reliable, and had great reviews in the community. But I quickly hit a wall: **no official Linux support**, and Kali wouldn’t recognize the adapter.

After digging through forums, some GitHub repos, I finally got it working. This repo is my way of giving back — a simple, working guide to help others in the community.

---

## 🔍 Adapter Overview

- **Model:** TP-Link Archer T2U Plus  
- **Chipset:** Realtek RTL8821AU 
- **WiFi:** Dual-band — 2.4GHz (150 Mbps) / 5GHz (433 Mbps)  
- **USB:** 2.0  
- **Antenna:** 5 dBi high-gain  
- **Supports monitor mode & packet injection:** ✅ With custom drivers  

This adapter is perfect for anyone starting out in wireless security, CTFs, or just learning Kali Linux.

---

## ⚙️ Installing the Driver on Kali Linux

### 🐧 Tested On
- Kali Linux 2023.4 & 2024.1
- Kernel 6.x

### 🔧 Step-by-Step Setup

#### 1. Update System
```bash
sudo apt update && sudo apt upgrade -y
```

#### 2. Install dependecies:
```bash
sudo apt install -y dkms git build-essential libelf-dev linux-headers-$(uname -r)
```
#### 3. Clone the Driver Repo
```bash
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
```

#### 4. Build and Install
```bash
sudo make dkms_install
```

#### 5. Check Wi-fi Interface
```bash
iwconfig
```
You should now see a new wireless interface (e.g., wlan0) ready to use.

## 🛠️ Optional: Auto-Installer Script
Want to skip the manual steps? Run this:

```bash
git clone https://github.com/jameskaois/tplink-archer-t2uplus-kali-linux.git
cd tplink-archer-t2uplus-kali-linux/scripts
chmod +x install.sh
./install.sh
```
This will handle the build, install, and modprobe automatically.



## 🧪 Tested Tools (Confirmed Working)

| Tool         | Status            | Description         |
|--------------|-------------------|---------------------|
| `airmon-ng`  | ✅ Monitor mode    | Enables monitor mode |
| `airodump-ng`| ✅ Packet capture  | Captures WiFi traffic |
| `aireplay-ng`| ✅ Injection OK    | Packet injection supported |
| `Wireshark`  | ✅ Sniffing works  | Real-time packet analysis |
| `wifite`     | ✅ Fully supported | Automated WiFi attacks |

## 🙌 Credit
Driver code: aircrack-ng/rtl8812au

Inspiration: Kali Linux forums, Reddit, GitHub community

## 🧑‍💻 Author
[JamesCao](https://github.com/jameskaois)

Kali Linux user, WiFi hacker in training, open-source supporter.

Connect on LinkedIn or drop a ⭐ if this helped you!
