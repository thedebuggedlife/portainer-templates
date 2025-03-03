# Real-Time Server Monitoring with Prometheus and Grafana

![](https://thedebugged.life/content/images/size/w1200/2025/03/monitoring-dashboard-example.png)

Monitoring your Linux server in real-time is crucial to keep it running smoothly and to react quickly at the first sign of an issue, thus preventing potential failures. Whether your server is running software for home automation, media streaming, or other self-hosted solutions, tracking key metrics like CPU usage, memory consumption, disk health, and running processes gives you better control over system performance. Rather than opportunistically checking logs or inspecting instant CPU/RAM metrics, having access to detailed historical data gives you a deeper insight into your system behavior.

For more info, see the original article at: https://thedebugged.life/real-time-server-monitoring-with-prometheus-and-grafana/

## Pre-requisite: Set Up Application Data

Before deploying this stack, we need create and configure permissions for the directories that Grafana and Prometheus will use to store their configuration files and databases.

> The following assumes your application data is stored under `/srv/appdata/` -- adjust as needed.

```bash
# Update if your appdata path is different
appdata=/srv/appdata

# Download appdata files
wget https://thedebuggedlife.github.io/portainer-templates/appdata/linux-monitoring.zip

# Unpack into local appdata folder
unzip -n linux-monitoring.zip -d $appdata/

# Setup proper permissions
sudo chown -R nobody:docker $appdata/process-exporter
sudo chown -R nobody:docker $appdata/prometheus
sudo chown -R nobody:docker $appdata/grafana
```

## Portainer Deployment

Follow these steps to deploy this project to your server using Portainer:

1. Include the app templates from this repository on your Portainer instance. See [how-to instructions](../README.md#how-to-use-the-templates) for more info.
2. Look for the app template called **Linux Server Monitoring** and click on it.
3. Review and modify **Configuration** values as appropriate and click on **Deploy the stack**.

## Docker Compose Deployment

Follow these steps if you want to deploy this project to your server using Docker Compose:

1. Prepare your workspace for deployment.

```bash
# Create a workspace for this project
mkdir -p ~/compose/linux-monitoring
cd ~/compose/linux-monitoring

# Get the deployment files
wget https://raw.githubusercontent.com/thedebuggedlife/portainer-templates/refs/heads/main/linux-monitoring/docker-compose.yml
wget https://raw.githubusercontent.com/thedebuggedlife/portainer-templates/refs/heads/main/linux-monitoring/.env
```

2. Make any necessary modifications to the `.env` file.
3. Deploy the stack! :rocket:

```bash
# Deploy the stack (detached)
docker compose up -d
```