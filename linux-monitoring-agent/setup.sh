#!/bin/bash
echo -e "\e[33mNote: This setup script may require entering your password for sudo\e[0m"
echo ""

# Ask user for appdata folder
read -p "Application data folder [/srv/appdata/linux-monitoring-agent]: " appdata
appdata=${appdata:-/srv/appdata/linux-monitoring-agent}

# Setup the appdata folder (only needed first time)
sudo mkdir -p $appdata
sudo chown $USER $appdata

# Download appdata files
cd $appdata
wget -qO- https://thedebuggedlife.github.io/portainer-templates/appdata/linux-monitoring-agent.zip | busybox unzip -n -

# Prepare prometheus files
echo ""
echo -e "What is the address of the Prometheus server to receive metrics from this agent (ex: 10.10.10.2:9090)?"
while [[ -z "$REMOTE_HOST" ]]; do
    read -p "Address: " REMOTE_HOST
done
sed -i "s/HOSTNAME/$(hostname)/g; s/REMOTE_HOST/$REMOTE_HOST/g" prometheus/prometheus.yml

# Setup proper permissions
sudo chown -R nobody:docker process-exporter prometheus