# docker_hyperion.ng
Hyperion.NG (Next Generation) Alpha Ambilight server in a Docker Container

#### Open Problems:
-- still in testing-- 


#### What is it for?:
I like to have most of my services in their own docker containers. As I could not find a fitting container I startet building one myself. This is the first image i have ever done.
The goal is to provide a standalone service for the hyperion.ng ambilight. This way I can have multiple picture sources (Kodi instances) running on different computers and cann still use the same Ambilight.
So far it simply works. (I only tried it with Kodi)

My setup consists of:
- 50RGB LED Strip WS2811
- Arduino Nano (with Adalight script, see .ino file)
- MediaPC/Homeserver running Kodi with Hyperion Addon

SignalFlow:
Kodi (Addon) --> Hyperion.ng Server (in Docker) --> Arduino on (/dev/ttyAdalight) --> LEDs


#### What does it do?:
1. It pulls the current stable ubuntu image
2. It updates/upgrades apt-get
3. It installs curl/wget
4. It runs the hyperion installation script from: https://github.com/hyperion-project/hyperion.ng/blob/master/CompileHowto.md
5. Runs the hyperiond server at startup. (config in /etc/hyperion/)

#### How to use:

working way (host network!)
```
docker run -d \
  --name="Hyperion.NG" \
  -v /etc/hyperion:/etc/hyperion:ro \
  --device=/dev/ttyAdalight:/dev/ttyAdalight
  --network host
  fred92/hyperion.ng:latest
```
Correct way, notfully working (random disconnects)
```
docker run -d \
  --name="Hyperion.NG" \
  -v /etc/hyperion:/etc/hyperion:ro \
  -p 8090:8090 \
  -p 19400:19400 \
  --device=/dev/ttyAdalight:/dev/ttyAdalight 
  fred92/hyperion.ng:latest
```

#### Instructions:

- Generate your own Hyperion Config using the HyperCon Tool: https://hyperion-project.org/wiki/HyperCon-Informationen
- Put the generated `hyperion.config.json` file in /etc/hyperion (or change the bind)



#### Changelog: 
- 2020-01-12 - Started this repo
