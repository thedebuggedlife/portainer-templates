#!/bin/bash
echo -e "\e[1;33mNote: This setup script may require entering your password for sudo\n\e[0m"

# Ask user for appdata folder
read -p "Application data folder [/srv/appdata/linux-monitoring-agent]: " appdata </dev/tty
appdata=${appdata:-/srv/appdata/linux-monitoring-agent}
echo "Using appdata path: $appdata"

# Setup the appdata folder (only needed first time)
sudo mkdir -p $appdata
sudo chown $USER $appdata

# Download appdata files
cd $appdata
wget -qO- https://thedebuggedlife.github.io/portainer-templates/appdata/linux-monitoring-agent.zip | busybox unzip -n -

# Prepare prometheus files
echo -e "\nEnter the hostname or IP and port of the Prometheus server that will\n  receive metrics from the agent (e.g., 10.10.10.2:9090 or prometheus.local:9090)\n"

# Regex for valid hostname or IP with port
valid_host_regex="^([a-zA-Z0-9.-]+|\b([0-9]{1,3}\.){3}[0-9]{1,3}\b):[0-9]+$"
while true; do
    read -p "Remote host: " REMOTE_HOST </dev/tty
    if [[ "$REMOTE_HOST" =~ $valid_host_regex ]]; then
        break
    else
        echo -e "\e[1;31mInvalid input. Please enter a valid hostname or IP with a port\n  (e.g., 10.10.10.2:9090 or prometheus.local:9090)\n\e[0m"
    fi
done
echo "Using remote host: $REMOTE_HOST"
sed -i "s/HOSTNAME/$(hostname)/g; s/REMOTE_HOST/$REMOTE_HOST/g" prometheus/prometheus.yml

# Setup proper permissions
sudo chown -R nobody:docker process-exporter prometheus