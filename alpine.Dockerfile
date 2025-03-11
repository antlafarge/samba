FROM alpine:latest

LABEL dockerhub="https://hub.docker.com/r/antlafarge/samba" \
      github="https://github.com/antlafarge/samba" \
      maintainer.name="Antoine Lafarge" \
      maintainer.email="ant.lafarge@gmail.com" \
      maintainer.github="https://github.com/antlafarge" \
      maintainer.dockerhub="https://hub.docker.com/u/antlafarge"

ENV LANG='C.UTF-8'
ENV LC_ALL='C.UTF-8'

RUN apk update \
 && apk -U upgrade \
 && apk add --no-cache samba

EXPOSE 445 137 138 139 1512

ENTRYPOINT ["smbd"]
CMD ["--foreground", "--no-process-group", "--debug-stdout"]
