Source: https://anooppoommen.medium.com/create-a-wifi-hotspot-on-linux-29349b9c582d 

1. I added an interface called new using:
`sudo iw phy phy0 interface add new1 type __ap`

2. start the interface at specific IP (possibly need to down an existing one)
  - `sudo ifconfig new1 192.168.28.1 up`

3. `sudo hostapd hostapd.conf` to start the AP
4. `sudo udhcp -f` to start the DHCP server 
