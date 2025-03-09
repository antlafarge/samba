SAMBA
=====

# Run

```bash
docker run -d -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba samba:alpine
docker run --rm -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba samba:alpine
docker run --rm -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba samba:alpine smbd --foreground --no-process-group  --debug-stdout --debuglevel=3
docker run --rm -it -p 445:445/tcp -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 1512:1512/udp --name samba --entrypoint sh samba:alpine
```

# Build

```bash
cd samba
docker build -t samba:alpine -f alpine.Dockerfile .
```
