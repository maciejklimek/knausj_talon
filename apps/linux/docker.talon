tag: user.docker
-

docker: "sudo docker "
docker build:
    insert("sudo docker build .")
    key("enter")
docker build (tag|tagged):
    insert("sudo docker build -t \"\" .")
    key("left:3")
docker list images:
    insert("sudo docker images\n")
docker list containers:
    insert("sudo docker ps -a\n")
docker running:
    insert("sudo docker ps\n")
docker pull: "docker pull "
docker stop: "sudo docker stop "
docker (remove|delete) image: "sudo docker rmi "
docker (remove|delete) [container]: "sudo docker rm "
docker run: "sudo docker run -d "
docker inspect: "sudo docker inspect "
docker enter: "sudo ~/bin/docker-enter "
docker shell: 
    user.insert_cursor("docker exec -it [|] /bin/bash")
    key("tab")
docker compose up: "sudo docker-compose up\n"
docker compose stop: "sudo docker-compose stop\n"
docker compose build: "sudo docker-compose build\n"

# volumes
docker volume list:
    insert("sudo docker volume ls\n")
docker volume create:
    insert("sudo docker volume create ")
docker volume inspect:
    insert("sudo docker volume inspect ")
docker volume remove:
    insert("sudo docker volume rm ")
