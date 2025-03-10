SAMBA
=====

# Docker

```yml
services:
    samba:
        image: antlafarge/samba:latest
        container_name: samba
        restart: unless-stopped
        volumes:
            - /home/MyUser/:/home/MyUser/
            - /hdd/:/hdd/
            - /storage/:/storage/
        networks:
            - samba
        ports:
            - 445:445/tcp
            - 137:137/udp
            - 138:138/udp
            - 139:139/tcp
            - 1512:1512/udp
        environment:
            TZ: Europe/Paris

networks:
    samba:
        driver: bridge
```

```bash
docker run -d -v /home/MyUser/:/home/MyUser/ -v /hdd/:/hdd/ -v /storage/:/storage/ -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba antlafarge/samba:alpine

docker run -d -v /hdd/:/hdd/ -v /storage/:/storage/ -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba antlafarge/samba:dev-alpine

docker run --rm -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba antlafarge/samba:dev-alpine

docker run --rm -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba antlafarge/samba:dev-alpine --foreground --no-process-group  --debug-stdout --debuglevel=3

docker run --rm -it -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba --entrypoint sh antlafarge/samba:dev-alpine
```

# Build

```bash
cd samba
docker build -t samba:dev-alpine -f alpine.Dockerfile .
```
