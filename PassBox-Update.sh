#!/bin/bash -e

# Copyleft (c) 2022.
# -------==========-------
# Ubuntu Server 22.04.01
# Hostname: orcp6-5
# Username: c1tech
# Password: 1478963
# -------==========-------
# To Run This Script
# wget https://raw.githubusercontent.com/Hamid-Najafi/C1-Control-Panel/main/ControlPanel-Update.sh && chmod +x ControlPanel-Update.sh && sudo ./ControlPanel-Update.sh
# OR
# wget https://b2n.ir/e44282 -O CP-Update.sh && chmod +x CP-Update.sh && sudo ./CP-Update.sh
# -------==========-------
echo "-------------------------------------"
echo "Updating Contold Panel Application"
echo "-------------------------------------"
url="https://github.com/Hamid-Najafi/C1-Control-Panel.git"
folder="/home/c1tech/C1-Control-Panel"
[ -d "${folder}" ] && rm -rf "${folder}"    
git clone "${url}" "${folder}"
folder="/home/c1tech/C1"
[ -d "${folder}" ] && rm -rf "${folder}"    
mv /home/c1tech/C1-Control-Panel/C1 /home/c1tech/
cd /home/c1tech/C1-Control-Panel/Panel
touch -r *.*
qmake
make -j4 

chown -R c1tech:c1tech /home/c1tech/C1
chown -R c1tech:c1tech /home/c1tech/C1-Control-Panel
echo "-------------------------------------"
echo "Done, Performing System Reboot"
echo "-------------------------------------"
init 6