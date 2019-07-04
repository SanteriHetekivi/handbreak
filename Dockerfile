FROM alpine:edge

# Adding testing repositorys.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Installing nessesary libraries.
RUN apk update \
    # Handbreak itself.
    && apk add --no-cache handbrake \
    # For group/usermod.
    && apk add --no-cache shadow \
    # For running script with given user.
    && apk add --no-cache gosu

# Making directories.
RUN mkdir /app
RUN mkdir /data
WORKDIR /app

# Moving scripts.
COPY run.sh /app/run.sh
COPY encode.sh /app/encode.sh
RUN chmod +x /app/*.sh

# Adding user for running scripts.
RUN addgroup --gid 911 app \
    && mkdir -p /usr/src/app \
    && adduser -u 911 -G app -h /usr/src/app -S app

# Adding entrypoint.
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Runnin command.
CMD ["/app/run.sh"]