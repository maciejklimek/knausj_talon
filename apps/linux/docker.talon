tag: user.docker
-

#docker: "docker "
docker build:
    insert("docker build .")
    key("enter")
docker build (tag|tagged):
    insert("docker build -t \"\" .")
    key("left:3")
docker pull: "docker pull "
docker stop: "docker stop "
docker kill: "docker kill "
docker (remove|delete) [container]: "docker rm "
docker run: "docker run -d "
docker run interactive: "docker run -it --rm "
docker (log|logs): "docker logs "
docker inspect: "docker inspect "
docker enter: "~/bin/docker-enter "
docker (terminal|shell): 
    insert("docker ps\n")
    user.insert_cursor("docker exec -it [|] /bin/bash")

# images
docker (image|images) list:
    insert("docker images\n")
docker image remove:
    insert("docker image rm ")

# containers
docker container prune:
    insert("docker container prune ")
docker container list all:
    insert("docker ps -a\n")
docker container list:
    insert("docker ps\n")
    
# volumes
docker volume list:
    insert("docker volume ls\n")
docker volume create:
    insert("docker volume create ")
docker volume inspect:
    insert("docker volume inspect ")
docker volume remove:
    insert("docker volume rm ")

## docker Compose
docker compose up: "docker-compose up\n"
docker compose stop: "docker-compose stop\n"
docker compose build: "docker-compose build\n"
