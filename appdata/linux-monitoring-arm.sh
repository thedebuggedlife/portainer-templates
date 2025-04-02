#!/bin/bash
echo -e "\e[1;33mNote: This setup script may require entering your password for sudo\n\e[0m"

# Ask user for appdata folder
read -p "Application data folder [/srv/appdata/linux-monitoring]: " appdata </dev/tty
appdata=${appdata:-/srv/appdata/linux-monitoring}
echo -e "Using appdata path: $appdata\n"

# Check if directory exists and ask the user whether to clear it
if [[ -d "$appdata" ]]; then
    echo -e "\e[1;33mWarning: The directory $appdata already exists.\e[0m"
    read -p "Do you want to delete its contents before proceeding? [y/N]: " confirm </dev/tty
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        sudo rm -rf "$appdata"/*
        echo -e "Contents of $appdata have been deleted.\n"
    fi
fi

# Setup the appdata folder (only needed first time)
sudo mkdir -p $appdata
sudo chown $USER $appdata

# Download appdata files
cd $appdata
wget -qO- https://thedebuggedlife.github.io/portainer-templates/appdata/linux-monitoring-arm.zip | busybox unzip -n -

# Prepare prometheus files
sed -i "s/HOSTNAME/$(hostname)/g" prometheus/prometheus.yml

# Setup proper permissions
sudo chown -R nobody:docker process-exporter prometheus grafana