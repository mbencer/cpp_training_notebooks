# How to build environment to use OpenVINO C++ Notebooks

Pre:
- Windows: Install Docker Desktop for Windows https://docs.docker.com/desktop/install/windows-install/

1. Build docker image:
```
docker build -t cpp_training --build-arg http_proxy=<HTTP_PROXY_IF_NEEDED> --build-arg https_proxy=<HTTPS_PROXY_IF_NEEDED> .
```
2. Run container:
```
docker run -d -p 8080:8080 cpp_training
```

TIP: If you want to copy  your changes from docker container to host, you can use command:
```
docker cp <DOCKER_ID>:/home/ <path_in_host>
```
where you can list all run container using command:
```
docker ps
```
TIP2: If you want to run the container via shell (like bash), you can use command:
```
docker run -it cpp_training bash
```
