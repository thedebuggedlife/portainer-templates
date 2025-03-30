# Create a Zero-Config, Mesh VPN, For All Your Devices

![](https://developers.cloudflare.com/_astro/handshake.eh3a-Ml1_1IcAgC.webp)

[Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/) provides you with a secure way to connect your resources to Cloudflare without a publicly routable IP address. With Tunnel, you do not send traffic to an external IP — instead, a lightweight daemon in your infrastructure (`cloudflared`) creates outbound-only connections to Cloudflare's global network. Cloudflare Tunnel can connect HTTP web servers, [SSH servers](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/use-cases/ssh/), (remote desktops)[https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/use-cases/rdp/], and other protocols safely to Cloudflare. This way, your origins can serve traffic through Cloudflare without being vulnerable to attacks that bypass Cloudflare.

## Pre-requisite: Create a tunnel and get the token

1. Open your [Cloudflare Dashboard](https://dash.cloudflare.com)
2. On the left-hand options, click on **Zero Trust**
3. Expand **Networks**, click on **Tunnels**
4. Click on **Create a tunnel**
5. Select **Cloudflared**
6. On **Choose your environment**, select **Docker**
7. Copy the command that shows in the section titled **Install and run a connector**
8. Paste the command somewhere (e.g. notepad)
9. From the extracted command, copy the token (what appears after `--token`) and save it

## Deployment

You can deploy this app template using Portainer:

1. Configure your Portainer Server to use the App Templates hosted in this repository. See [how-to instructions](../README.md#how-to-use-the-templates) for more info.
2. Look for the app template called **Cloudflare Tunnel** and click on it.
3. <ins>Review the notes under **Information**</ins> and modify the **Configuration** values accordingly.
    - Under **Configuration** you'll need to enter the **Token** extracted as part of the pre-requisite steps above.
4. Click on **Deploy the stack**.