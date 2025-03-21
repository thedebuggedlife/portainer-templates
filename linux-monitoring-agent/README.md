# Real-Time Server Monitoring - Agent Role

![](https://images.unsplash.com/photo-1683322499436-f4383dd59f5a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDMxfHxzZXJ2ZXIlMjByYWNrfGVufDB8fHx8MTc0MjE2NjM0OHww&ixlib=rb-4.0.3&q=80&w=2000)

Monitor multiple servers efficiently with Prometheus in Agent Mode, a scalable setup that optimizes resource use while centralizing metrics in Grafana. You will need a central server with Prometheus and Grafana to aggregate metrics, which you can deploy using the [Linux Server Monitoring](../linux-monitoring/) stack. Then, deploy this stack to all additional servers you want to monitor from your central Grafana server.

In this configuration, each monitored server runs a lightweight Prometheus instance that scrapes local metrics and forwards them to a central Prometheus server via remote write. Since these agents do not store long-term data, they require significantly less storage, reducing overhead on individual machines while optimizing network usage. This architecture provides a scalable and resource-efficient way to monitor multiple machines in a home lab or production environment.

For more info, see the original article at: https://thedebugged.life/scalable-server-monitoring-with-prometheus/

> This stack is **not compatible** with ARM and ARM64 devices. For those, use the alternate [Linux Server Monitoring - Agent Role [arm|arm64]](../linux-monitoring-agent-arm/) stack.

## Pre-requisite: Set Up Application Data

Before deploying this stack, we need create and configure permissions for the directories that Grafana and Prometheus will use to store their configuration files and databases:

```bash
wget -qO- https://thedebuggedlife.github.io/portainer-templates/appdata/linux-monitoring-agent.sh | bash
```

## Deployment

You can deploy this stack using Portainer (recommended) or Docker Compose.

### Using Portainer

Follow these steps to deploy this project to your server using Portainer:

1. Configure your Portainer Server to use the App Templates hosted in this repository. See [how-to instructions](../README.md#how-to-use-the-templates) for more info.
2. Look for the app template called **Linux Server Monitoring (Agent)** and click on it.
3. Review and modify **Configuration** values as appropriate and click on **Deploy the stack**.

### Using Docker Compose

Follow these steps if you want to deploy this project to your server using Docker Compose:

1. Prepare your workspace for deployment.

```bash
# Create a workspace for this project
mkdir -p ~/compose/linux-monitoring-agent
cd ~/compose/linux-monitoring-agent

# Get the deployment files
wget https://raw.githubusercontent.com/thedebuggedlife/portainer-templates/refs/heads/main/linux-monitoring-agent/docker-compose.yml
wget https://raw.githubusercontent.com/thedebuggedlife/portainer-templates/refs/heads/main/linux-monitoring-agent/.env
```

2. Make any necessary modifications to the `.env` file.
3. Deploy the stack! :rocket:

```bash
docker compose up -d
```