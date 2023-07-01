#!/bin/bash

# Aktualizacja systemu
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean
sudo updatedb
sudo systemctl restart systemd-journald

# Optymalizacja systemu
echo 'vm.swappiness=10' | sudo tee /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Wyczyszczenie cache serwera
sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
