# Yavu

This an experiment to build a continuos deploy system with Pharo Smalltalk. This experimental system have these main objetives:

* Learn about the domain (Suppliers, Sales, Beer production, Purchases, Taxes) in Object System
* Learn about the continous deploy experiencie

## The Domain

We write more about the object system that we're trying to build here...

## The continous deploy experiencie

I'm tring to build a big system with just one developer and for that I want to minimice the accidental complexity associated to all the computacional artifacts that a developer need to accomplish all the task required in the development process: understand the funciational requirements, develop, test, build and deploy.

** I'll use this technologies: **

* Linux (Ubuntu or Debian)
* Pharo (https://pharo.org/)
* Git (https://git-scm.com/)
* Nginx (https://www.nginx.com/)
* MongoDB (https://www.mongodb.com)
* Github (https://github.com/)
* Travis (https://travis-ci.org)
* Digital Ocean (https://www.digitalocean.com/)

### Setting the environment

Set up all that stuff is a lot of time consuming on configuration tasks. So I'll document here as simple as possible in order to easy start fresh on a new machine or operative system is it's necesary.

* ** Linux **

I'm using Kubuntu 16.04 but I'll write this document using Kubuntu 18.04 LTS.

* ** Pharo **

There several ways to install Pharo, I'll use the same that Travis use:

Open a Konsole an evaluate:

	wget http://files.pharo.org/get-files/80/pharo64-linux-stable.zip
	unzip pharo64-linux-stable.zip
	wget http://files.pharo.org/get-files/80/pharo64.zip
	unzip pharo64.zip

* ** GIT **

I need git in order to install my project and its dependences into Pharo.

On a Konsole evaluate: 

	apt-get install git

*** Setting up git on Pharo ***

>Copy your SSH keys to the machine or generate new ones.
>Configure Pharo to use yours custom SSH keys under Pharo -> Settings.

*** Installing Project ***

>Open Iceberg and clone Yavu project.
>Install project baseline.

* ** Nginx **

I'll use nginx to serve static files for the project.

On a Konsole evaluate:

	apt-get install nginx
	
>Copy the configuration file (/build/yavusoft.conf) to the nginx folder (/etc/nginx/config.d).
>Restart the service (service nginx restart)

* ** Mongo DB **
