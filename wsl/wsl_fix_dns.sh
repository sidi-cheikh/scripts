#!/bin/bash
# WSL DNS Fix. 

# backup current dns config
sudo cp /etc/resolv.conf /etc/resolv.conf_bak

# disable auto-generation of DNS config file resolv.conf
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'

# delete auto-generated dns config file
sudo rm /etc/resolv.conf

# add UST dns servers to resolv.conf
sudo bash -c 'echo "nameserver 140.209.3.110" > /etc/resolv.conf'
sudo bash -c 'echo "nameserver 140.209.3.111" >> /etc/resolv.conf'
# copy the ISP dns servers from the backup file
sudo bash -c 'cat /etc/resolv.conf_bak | grep -v "^#" >> /etc/resolv.conf'

