#!/bin/bash
echo -e "\e[1;33mNote: This setup script may require entering your password for sudo\n\e[0m"

# Ask user for appdata folder
read -p "Application data folder [/srv/appdata/linux-monitoring]: " appdata </dev/tty
appdata=${appdata:-/srv/appdata/linux-monitoring}
echo "Using appdata path: $appdata"

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