#!/bin/bash
echo -e "\e[33mNote: This setup script may require entering your password for sudo\e[0m"
echo ""

# Ask user for appdata folder
read -p "Application data folder [/srv/appdata/linux-monitoring]: " appdata
appdata=${appdata:-/srv/appdata/linux-monitoring}

# Setup the appdata folder (only needed first time)
sudo mkdir -p $appdata
sudo chown $USER $appdata

# Download appdata files
cd $appdata
wget -qO- https://thedebuggedlife.github.io/portainer-templates/appdata/linux-monitoring.zip | busybox unzip -n -

# Prepare prometheus files
sed -i "s/HOSTNAME/$(hostname)/g" prometheus/prometheus.yml

# Setup proper permissions
sudo chown -R nobody:docker process-exporter prometheus grafana