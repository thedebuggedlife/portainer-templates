# Create a Zero-Config, Mesh VPN, For All Your Devices

![](https://developers.cloudflare.com/_astro/handshake.eh3a-Ml1_1IcAgC.webp)

[Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/) provides you with a secure way to connect your resources to Cloudflare without a publicly routable IP address. With Tunnel, you do not send traffic to an external IP — instead, a lightweight daemon in your infrastructure (`cloudflared`) creates outbound-only connections to Cloudflare's global network. Cloudflare Tunnel can connect HTTP web servers, [SSH servers](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/use-cases/ssh/), (remote desktops)[https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/use-cases/rdp/], and other protocols safely to Cloudflare. This way, your origins can serve traffic through Cloudflare without being vulnerable to attacks that bypass Cloudflare.

## Deployment

You can deploy this app template using Portainer:

1. Configure your Portainer Server to use the App Templates hosted in this repository. See [how-to instructions](../README.md#how-to-use-the-templates) for more info.
2. Look for the app template called **Cloudflare Tunnel** and click on it.
3. <ins>Review the notes under **Information**</ins> and modify the **Configuration** values accordingly.
    - Under **Configuration** you'll need to enter the **Token** extracted as part of the pre-requisite steps above.
4. Click on **Deploy the stack**.