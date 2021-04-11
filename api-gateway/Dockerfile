# Start with a base image containing haproxy runtime
FROM haproxy:lts-alpine

# Maintainer info
LABEL maintainer="Mohammed Amine BOUTOUIL <boutouilmohammedamine@gmail.com>"

RUN apk add --no-cache --update \
    inotify-tools

COPY conf.d/entrypoint.sh /usr/local/bin/entrypoint

RUN deluser haproxy \
 && addgroup -g 1001 haproxy \
 && adduser -u 1001 -G haproxy -D -s /bin/false haproxy \
 && mkdir -p /var/empty /etc/haproxy /var/lib/haproxy /var/run/haproxy \
 && chown -R haproxy:haproxy /etc/haproxy /var/lib/haproxy /var/run/haproxy \
 && chmod 0 /var/empty \
 && chmod 755 /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]