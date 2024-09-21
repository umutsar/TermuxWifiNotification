## Termux Wifi Notification
# Brief
When your wifi connection status has been connected or disconnected you can learn this information with sound. (Change parameters to that you want). You have to access root permission for termux. 

# Instructions

1- Make sure your phone has root privileges.

2- Install F-droid

Install termux, termux-api and termux:boot from F-droid. 

3- Create Ruby File

Enter termux and enter these lines:
```bash
su
```
```bash
mkdir -p /data/data/com.termux/files/home/.termux/boot
```
```bash
cd /data/data/com.termux/files/home/.termux/boot
```
And last one, create starting.sh file and copy my code to this file:

```bash
nano starting.sh
```
