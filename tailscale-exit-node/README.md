# Create a Zero-Config, Mesh VPN, For All Your Devices

![](https://cdn.sanity.io/images/w77i7m8x/production/fab2bfd901de3d58f7f62d35fe9a5107fedc43c1-1360x725.svg?w=3840&q=75&fit=clip&auto=format)

[Tailscale](https://tailscale.com/) is a modern, easy-to-use VPN service that simplifies connecting devices and services securely across different networks. Tailscale creates a "mesh" VPN, meaning devices connect directly to each other, rather than going through a central server, which can improve performance and security.

> This template configures Tailscale to act as an exit node. If you want to install Tailscale without that option, use the [tailscale](../tailscale/) template instead.

## Pre-requisite: Set Up Application Data

Before deploying this app template, we need create and configure permissions for the directories that Tailscale will use to store configuration and state files.

Run these commands from a terminal on the server where Tailscale will be deployed:

```bash
sudo mkdir -p /srv/appdata
sudo chmod $USER /srv/appdata
```

## Deployment

You can deploy this app template using Portainer:

1. Configure your Portainer Server to use the App Templates hosted in this repository. See [how-to instructions](../README.md#how-to-use-the-templates) for more info.
2. Look for the app template called **Tailscale** and click on it.
3. <ins>Review the notes under **Information**</ins> and modify the **Configuration** values accordingly.
4. Click on **Deploy the stack**.