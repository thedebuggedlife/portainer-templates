# Ad-Blocking for All Your Devices With Pi-hole

![](https://images.unsplash.com/photo-1544393569-eb1568319eef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDd8fHN0b3B8ZW58MHx8fHwxNzQyNTc1NDcxfDA&ixlib=rb-4.0.3&q=80&w=2000)

Online ads have become more invasive, heavier, and harder to escape—slowing down pages, draining battery, and compromising privacy. While browser extensions help, they don’t cover every device, and they often miss in-app ads or smart TVs entirely.

Enter [Pi-hole](https://pi-hole.net/?ref=thedebugged.life): a lightweight DNS-based ad blocker you can run on a Raspberry Pi or any Linux machine. It silently filters requests across your network, giving all connected devices a cleaner, faster, and more private experience.

For more info, see the original article at: https://thedebugged.life/pi-hole-ad-blocking-for-all-your-devices/

## Pre-requisite: Set Up Application Data

Before deploying this app template, we need create and configure permissions for the directories that Pi-hole will use to store their configuration files and databases. 

Run these commands from a terminal on the server where Pi-hole will be deployed:

```bash
sudo mkdir -p /srv/appdata
sudo chmod $USER /srv/appdata
```

## Deployment

You can deploy this app template using Portainer:

1. Configure your Portainer Server to use the App Templates hosted in this repository. See [how-to instructions](../README.md#how-to-use-the-templates) for more info.
2. Look for the app template called **Pi-hole** and click on it.
3. <ins>Review the notes under **Information**</ins> and modify the **Configuration** values accordingly.
4. Click on **Deploy the stack**.