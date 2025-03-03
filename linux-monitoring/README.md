# Real-Time Server Monitoring with Prometheus and Grafana

![](https://thedebugged.life/content/images/size/w1200/2025/03/monitoring-dashboard-example.png)

Monitoring your Linux server in real-time is crucial to keep it running smoothly and to react quickly at the first sign of an issue, thus preventing potential failures. Whether your server is running software for home automation, media streaming, or other self-hosted solutions, tracking key metrics like CPU usage, memory consumption, disk health, and running processes gives you better control over system performance. Rather than opportunistically checking logs or inspecting instant CPU/RAM metrics, having access to detailed historical data gives you a deeper insight into your system behavior.

These files are meant to be used as reference for the article published at: https://thedebugged.life/real-time-server-monitoring-with-prometheus-and-grafana/

## Pre-requisite: Set Up Application Data

Before deploying this stack, we need create and configure permissions for the directories that Grafana and Prometheus will use to store their configuration files and databases.

> The following assumes your application data is stored under `/srv/appdata/` -- adjust as necessary.

```bash
# Download appdata files
wget https://files.thedebugged.life/appdata/linux-monitoring.zip

# Unpack into local appdata folder
unzip -n linux-monitoring.zip -d /srv/appdata/

# Setup proper permissions
sudo chown -R 472:docker /srv/appdata/grafana
sudo chown -R 65534:docker /srv/appdata/prometheus
```