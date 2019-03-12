# Great Resources

# Great introductory posts about Docker

- [Docker 101: Fundamentals & The Dockerfile – Paige Niedringhaus – Medium](https://medium.com/@paigen11/docker-101-fundamentals-the-dockerfile-b33b59d0f14b)
- [Docker 102: Docker-Compose – Paige Niedringhaus – Medium](https://medium.com/@paigen11/docker-102-docker-compose-6bec46f18a0e)
- [Dockerfile Explained](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images)

# Docker Commands 

-  `docker images` – Check the number of images on your system.
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
- [Overview of docker-compose CLI | Docker Documentation](https://docs.docker.com/compose/reference/overview/)

# Docker for rails applications
- [Developing a Ruby on Rails app with Docker Compose – FireHydrant – Medium](https://medium.com/firehydrant-io/developing-a-ruby-on-rails-app-with-docker-compose-d75b20334634)
- [GitHub - K-Sato1995/docker_practice](https://github.com/K-Sato1995/docker_practice)
