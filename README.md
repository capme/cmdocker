Micro Bridge Docker
===================

Micro Bridge Docker is container for aCommerce sysadmin or developer of channel management to build, ship, and run distributed applications, whether on laptops, data center VMs, or the cloud.

Version
-------
1.0.0

### Status
Currently now have develop branch ready which mean it can only be use for local and develop environment for now.

### What's inside develop branch?
- [Php v5.6.16] 
- [Nginx v1.8.0]
- [MongoDB v3.0.7]

Installation
------------

Check your docker machine if active and running buy executing command below.

```sh
$ docker-machine ls
```

if not please refer to  install and run docker machine link below:
- [Installation on Mac OSX][iomosx]
- [Installation on Ubuntu Linux][ioul]
- [Get started with Docker Machine and a local VM][gswdm]

First you need to install images.
```sh
$ docker build -t micro-bridge .
```

Create web app folder to your home directory and put your micro-bridge web app repository inside 
**$HOME/app/web/acommerce/micro-bridge/** and change folder name to **elevenia**

Run container from ready image and name it to *micro-bridge*.

```sh
$ ./run
```

To test everything work follow this step:

This command will show your machine info
```sh
$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE      URL
default   *        virtualbox   Running    tcp://192.168.99.100:2376
```

This command will show which container is running:
```sh
$ docker ps
STATUS              PORTS
Up 2 hours         0.0.0.0:80->80/tcp, 0.0.0.0:27017->27017/tcp
```

Type url below on your web browser to see if everything work.
**http://192.168.99.100/info.php**
> ***Note:***
> - The IP Address is from **$ docker-machine ip default** command

Set your **/etc/hosts** as below so you can access **http://micro-bridge-elevenia** on your browser
```
192.168.99.100 micro-bridge-elevenia
```

# Bonus Command
Stop container
```sh
$ docker ps
STATUS        NAMES
Up 2 hours    micro-bridge
$ docker stop micro-bridge
```

Start container
```sh
$ docker start micro-bridge
```

Restart container
```sh
$ docker restart micro-bridge
```

You have done so far, Congratulation!!!

if you have any question please don't hesitate to ask Channel Management Team.

<rizha.musthafa@acommerce.asia>

Have suggestion? or want to contribute? Great!

License
-------

aCommerce

[ioul]: <https://docs.docker.com/engine/installation/ubuntulinux/>
[iomosx]: <https://docs.docker.com/engine/installation/mac/>
[gswdm]: <https://docs.docker.com/machine/get-started/>