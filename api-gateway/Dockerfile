# Start with a base image containing haproxy runtime
FROM haproxy:lts-alpine

# Maintainer info
LABEL maintainer="Mohammed Amine BOUTOUIL <boutouilmohammedamine@gmail.com>"

RUN set -exo pipefail \
    && apk add --no-cache --update \
        rsyslog \
        inotify-tools \
    && mkdir -p /etc/rsyslog.d \
    && touch /var/log/haproxy.log \
    && ln -sf /dev/stdout /var/log/haproxy.log

COPY conf.d/rsyslog.conf /etc/rsyslog.d/
COPY conf.d/entrypoint.sh /usr/local/bin/entrypoint

RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

RUN deluser haproxy \
 && addgroup -g 1001 haproxy \
 && adduser -u 1001 -G haproxy -D -s /bin/false haproxy \
 && mkdir -p /var/empty /etc/haproxy /var/lib/haproxy /var/run/haproxy \
 && chown -R haproxy:haproxy /etc/haproxy /var/lib/haproxy /var/run/haproxy \
 && chmod 0 /var/empty \
 && chmod 755 /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]