# Great Resources

# Great introductory posts about Docker

- [Docker 101: Fundamentals & The Dockerfile – Paige Niedringhaus – Medium](https://medium.com/@paigen11/docker-101-fundamentals-the-dockerfile-b33b59d0f14b)
- [Docker 102: Docker-Compose – Paige Niedringhaus – Medium](https://medium.com/@paigen11/docker-102-docker-compose-6bec46f18a0e)
- [Dockerfile Explained](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images)

# Docker Commands 

-  `docker images` – Check the images on your system.
-  `docker ps`  – Check a list of your running containers.
-  `docker search <image>` – Searching an image in the Docker Hub.
- `docker run` – Runs a command in a new container.
- `docker start` – Starts one or more stopped containers
- `docker stop` – Stops one or more running containers
- `docker build` – Builds an image form a Docker file
- `docker pull` – Pulls an image or a repository from a registry
- `docker push` – Pushes an image or a repository to a registry
- `docker export` – Exports a container’s filesystem as a tar archive
- `docker exec` – Runs a command in a run-time container
- `docker search` – Searches the Docker Hub for images
- `docker attach` – Attaches to a running container
- `docker commit` – Creates a new image from a container’s changes
- `docker rmi $(docker images -q)` – Delete all the existing images on your system. (`-f` is the `force` option.)

- [A Guide to Docker Commands with Examples](https://afourtech.com/guide-docker-commands-examples/)
- [Docker Base Commands](https://docs.docker.com/engine/reference/commandline/docker/)

# Docker Compose commands

- `docker-compose ps` — lists all the services in a network.
- `docker-compose build` — generates any needed images from custom Dockerfiles. It will not pull images from the Docker hub, only generate custom images.
- `docker-compose up ` — brings up the network for the services to run in
- `docker-compose stop` — stops the network and saves the state of all the services
- `docker-compose start ` — restarts the services and brings them back up with the state they had when they were stopped
- `docker-compose down` — burns the entire Docker network with fire. The network and all the services contained within are totally destroyed. (edited)

### Other commands
- [docker-compose コマンドまとめ](https://qiita.com/wasanx25/items/d47caf37b79e855af95f)
- [Overview of docker-compose CLI | Docker Documentation](https://docs.docker.com/compose/reference/overview/)

# Docker for rails applications
- [Developing a Ruby on Rails app with Docker Compose – FireHydrant – Medium](https://medium.com/firehydrant-io/developing-a-ruby-on-rails-app-with-docker-compose-d75b20334634)
- [GitHub - K-Sato1995/docker_practice](https://github.com/K-Sato1995/docker_practice)

# Small gotchas
## Image and Container
- An `image` is an executable package that includes everything needed to run an application--the code, a runtime, libraries, environment variables, and configuration files. (you can create an image from a `Dockerfile` by running `docker build`).  
- A` container` is a runtime instance of an image. A `container` is launched by running an image.

## docker `build` 
`docker build -t container_name` would make a tag which you can use to refer to the container.

## docker-compose `ports`

```yml
    ports:
      - "4000:80"
```
means you are mapping your __machine’s port 4000__ to the __container’s published port 80__.

## `apk` command in Dockerfile. 
- [Alpine Linux package management](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)

## docker-compose `volumes`

- [docker-compose.ymlのvolumesって何してるの？](https://www.nyamucoro.com/entry/2018/08/13/222617)
- [Docker Volumes and Networks with Compose](https://www.linux.com/learn/docker-volumes-and-networks-compose)

__Main uses of volumes__

- (1) Immediate reflection of changes that are made in mounted files.
- (2) The other use of volumes in Docker is for persistent data

__Mounting files.__

```yml
volumes:
      - ./:/app
``` 
means to mount the current local directory (./) into the container's /app directory.

__Data persistance__

We can create a Docker volume and mount it in `/var/lib/mysql` of the database container. The life of this volume would be totally separate from the container lifecycle.  
Compose can help us with managing these so-called `named volumes`.   
They need to be defined under the `volumes` key in a compose file and can be used in a service definition.

```yml
version: '2'
services:
 mysql:  
  image: mysql
  container_name: mysql
  volumes:
    - mysql:/var/lib/mysql
...

volumes:
 mysql:
```

## .dockerignore
- [.dockerignore アンチパターン](https://qiita.com/munisystem/items/b0f08b28e8cc26132212)

## docker-compose `down` vs `stop` & `up` vs `start`
- [Docker Tip #45: Docker Compose Stop vs Down](https://nickjanetakis.com/blog/docker-tip-45-docker-compose-stop-vs-down)
