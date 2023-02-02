#!/bin/bash -e

# Copyleft (c) 2022.
# -------==========-------
# Ubuntu Server 22.04.01 || Armbian 22.11 Jammy || RaspbiOS 11 (bullseye)
# Hostname: PassBox5-1
# Username: c1tech
# Password: 1478963
# -------==========-------
# To Run This Script
# wget https://raw.githubusercontent.com/Hamid-Najafi/C1-PassBox/main/PassBox-Install.sh && chmod +x PassBox-Install.sh && sudo ./PassBox-Install.sh
# -------==========-------
echo "-------------------------------------"
echo "Configuring User & Groups"
echo "-------------------------------------"
# adduser c1tech --gecos "FUMP ICT,RoomNumber,WorkPhone,HomePhone" --disabled-password
# echo "c1tech:1478963" | chpasswd
usermod -a -G sudo c1tech
usermod -a -G dialout c1tech
usermod -a -G audio c1tech
usermod -a -G video c1tech
usermod -a -G input c1tech
echo "c1tech user added to sudo, dialout, audio, video & input groups"
# Give c1tech Reboot Permision
chown root:c1tech /bin/systemctl
sudo chmod 4755 /bin/systemctl
echo "-------------------------------------"
echo "Setting Hostname"
echo "-------------------------------------"
echo "Set New Hostname: (PassBox-Floor-Room)"
read hostname
hostnamectl set-hostname $hostname
echo "-------------------------------------"
echo "Setting TimeZone"
echo "-------------------------------------"
timedatectl set-timezone Asia/Tehran 
echo "-------------------------------------"
echo "Installing Pre-Requirements"
echo "-------------------------------------"
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y
apt install -y software-properties-common git avahi-daemon python3-pip 
apt install -y debhelper build-essential gcc g++ gdb cmake 
echo "-------------------------------------"
echo "Installing Qt & Tools"
echo "-------------------------------------"
apt install -y mesa-common-dev libfontconfig1 libxcb-xinerama0 libglu1-mesa-dev
apt install -q -y qt5* qttools5* qtmultimedia5* qtwebengine5* qtvirtualkeyboard* qtdeclarative5* qt3d5*
apt install -q -y qtbase5* 
apt install -q -y libqt5*
apt install -q -y qml-module*
echo "-------------------------------------"
echo "Installing Contold Panel Application"
echo "-------------------------------------"
url="https://github.com/Hamid-Najafi/C1-PassBox.git"

folder="/home/c1tech/C1"
[ -d "${folder}" ] && rm -rf "${folder}"

folder="/home/c1tech/C1-PassBox"
[ -d "${folder}" ] && rm -rf "${folder}"

git clone "${url}" "${folder}"

cd /home/c1tech/C1-PassBox/PassBox
touch -r *.*
qmake
make -j2

chown -R c1tech:c1tech /home/c1tech/C1-PassBox
echo "-------------------------------------"
echo "Creating Service for Contold Panel Application"
echo "-------------------------------------"
journalctl --vacuum-time=60d
loginctl enable-linger c1tech

cat > /etc/systemd/system/PassBox.service << "EOF"
[Unit]
Description=C1 Tech PassBox v1.0

[Service]
Type=idle
Environment="XDG_RUNTIME_DIR=/run/user/$UID"
Environment="DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus"
Environment="QT_QPA_PLATFORM=eglfs"
Environment="QT_QPA_EGLFS_ALWAYS_SET_MODE=1"
# Environment="QT_QPA_EGLFS_HIDECURSOR=1"
ExecStart=/home/c1tech/C1-PassBox/PassBox/PassBox -platform eglfs
Restart=always
# User=root

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable PassBox
systemctl restart PassBox
echo "-------------------------------------"
echo "Configuring PI Power Button"
echo "-------------------------------------"
# Connect the power button to Pin 5 (GPIO 3/SCL) and Pin 6 (GND)
# Shutdown functionality: Shut the Pi down safely when the button is pressed. The Pi now consumes zero power.
# Wake functionality: Turn the Pi back on when the button is pressed again.
git clone https://github.com/Howchoo/pi-power-button.git
./pi-power-button/script/install
echo "-------------------------------------"
echo "Configuring Splash Screen"
echo "-------------------------------------"
File=/boot/cmdline.txt
String=\ quiet\ splash\ plymouth.ignore-serial-consoles
if grep -q "$String" "$File"; then
echo "Boot CMDLINE OK"
else
truncate -s-1 "$File"
echo -n "$String" >> /boot/cmdline.txt
fi

# sudo nano /boot/config.txt
# disable_splash=1

apt -y autoremove --purge plymouth
apt -y install plymouth plymouth-themes
# plymouth-set-default-theme --list
sudo plymouth-set-default-theme spinner

# By default ubuntu-text is active 
# /usr/share/plymouth/themes/ubuntu-text/ubuntu-text.plymouth
# We Will use bgrt (which is same as spinner but manufacture logo is enabled) theme with our custom logo
cp /usr/share/plymouth/themes/spinner/bgrt-fallback.png{,.bak}
cp /usr/share/plymouth/themes/spinner/watermark.png{,.bak}
cp /usr/share/plymouth/ubuntu-logo.png{,.bak}
cp /home/c1tech/C1-PassBox/bgrt-c1.png /usr/share/plymouth/themes/spinner/bgrt-fallback.png
cp /home/c1tech/C1-PassBox/bgrt-c1.png /usr/share/plymouth/themes/spinner/watermark.png
update-initramfs -u
# update-alternatives --list default.plymouth
# update-alternatives --display default.plymouth
# update-alternatives --config default.plymouth
echo "-------------------------------------"
echo "Done, Performing System Reboot"
echo "-------------------------------------"
init 6
echo "-------------------------------------"
echo "Test Mic and Spk"
echo "-------------------------------------"
sudo apt install -y lame sox libsox-fmt-mp3

arecord -v -f cd -t raw | lame -r - output.mp3
play output.mp3
# -------==========-------
wget https://raw.githubusercontent.com/alphacep/vosk-api/master/python/example/test_microphone.py
python3 test_microphone.py -m fa
# -------==========-------
sudo apt-get --purge autoremove pulseaudio
# -------==========-------
sudo rm /etc/systemd/system/PassBox.service
sudo systemctl daemon-reload