FROM alpine:latest

LABEL dockerhub="https://hub.docker.com/r/antlafarge/samba" \
      github="https://github.com/antlafarge/samba" \
      maintainer.name="Antoine Lafarge" \
      maintainer.email="ant.lafarge@gmail.com" \
      maintainer.github="https://github.com/antlafarge" \
      maintainer.dockerhub="https://hub.docker.com/u/antlafarge"

ENV LANG='C.UTF-8'
ENV LC_ALL='C.UTF-8'
ENV TZ='Europe/Paris'

RUN apk add --no-cache --no-progress samba

RUN mkdir -p -m 770 /hdd/ \
 && mkdir -p -m 777 /storage/Public/ \
 && mkdir -p -m 775 /storage/Shared/ \
 && mkdir -p -m 770 /storage/Private/ \
 && chown -R root:users /hdd/ \
 && chown -R root:users /storage/Public/ \
 && chown -R root:users /storage/Shared/ \
 && chown -R root:users /storage/Private/

WORKDIR /storage/

EXPOSE 445 137 138 139 1512

ENTRYPOINT ["smbd"]
CMD ["--foreground", "--no-process-group", "--debug-stdout"]
