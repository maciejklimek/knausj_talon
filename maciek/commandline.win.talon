os: windows
mode: command
and tag: terminal
-
backend connect: "docker exec -ti -u 0 backend bash\n"
frontend start:
    insert("docker exec -ti -u 0 frontend bash\n")
    sleep(2000ms)
    insert("yarn start-localhost\n")
frontend connect: "docker exec -ti -u 0 frontend bash\n"
# frontend start: "yarn start-localhost\n"
infra go: "cd projects/produktoskop/infra-dev/\n"