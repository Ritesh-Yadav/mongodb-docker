# Docker For MongoDB

This project is to created docker image of MongoDB with a user.
[Read my post about this project](https://ritesh-yadav.github.io/tech/docker-instance-of-mongodb-with-ssl-support/)

## Pre-requisites
1. Install docker in your machine from https://docs.docker.com/engine/installation/
2. Run docker in your machine
3. Make entry in your `/etc/hosts` file like
    `127.0.0.1	localhost ry-dev.herokuapp.com`

## Steps to Create Docker Container
1. Go to folder which contains **DockerFile**
2. Run `docker build -t mongo .` (**mongo** is the tag name which will be used in next step)
3. Run `docker run -d -p 27017:27017 --mount source=mongodb,target=/data/db --mount source=configdb,target=/data/configdb --name mongoDB mongo:latest` (**mongoDB** is the container name which can be used for referring container in any other command)

## Other Useful Commands
* Check status of your container by `docker ps -a`
* Check logs of the container by `docker logs -f <CONTAINER ID OR NAME>`
* Remove any container `docker rm <CONTAINER ID OR NAME>`
* Get shell in container `docker exec -it <CONTAINER ID OR NAME> bash`
* Command line connection to MongoDB `mongo --ssl --host ry-dev.herokuapp.com --port 27017 --username mongodb --password mymongopass --authenticationDatabase mydatabase`
