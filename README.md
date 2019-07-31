# Steps

## On mac

Install XQuartz X11 by following [This medium post](https://medium.com/@mreichelt/how-to-show-x11-windows-within-docker-on-mac-50759f4b65cb)

It could be summarized in:

- Install the latest XQuartz X11 server and run it, from : https://www.xquartz.org/
- Activate the option ‘Allow connections from network clients’ in XQuartz settings
- Quit & restart XQuartz (to activate the setting) (The first time after installation you need to Logout and login again)
- Add the env var: `-e DISPLAY=host.docker.internal:0` to the container in the docker run command

Then run the docker image by following the guide in run.sh script
