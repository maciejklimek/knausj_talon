tag: user.docker
-

docker: "docker "
docker build:
    insert("docker build .")
    key("enter")
docker build (tag|tagged):
    insert("docker build -t \"\" .")
    key("left:3")
docker list images:
    insert("docker images\n")
docker list containers:
    insert("docker ps -a\n")
docker running:
    insert("docker ps\n")
docker pull: "docker pull "
docker stop: "docker stop "
docker (remove|delete) image: "docker rmi "
docker (remove|delete) [container]: "docker rm "
docker run: "docker run -d "
docker (log|logs): "docker logs "
docker inspect: "docker inspect "
docker enter: "~/bin/docker-enter "
docker (terminal|shell): 
    insert("docker ps\n")
    user.insert_cursor("docker exec -it [|] /bin/bash")

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
