FROM gcc:latest AS builder

COPY server/mini_server.c /mini_server.c

RUN apt-get update && \
    apt-get install -y libfcgi-dev && \
    gcc -o my_fcgi_mini_server /mini_server.c -lfcgi

FROM nginx:latest

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    chown -R nginx:nginx /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /var/cache/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chmod u-s /usr/bin/passwd /usr/bin/su /usr/bin/gpasswd && \
    chmod u-s /usr/bin/newgrp /usr/bin/chsh /usr/bin/umount /usr/bin/mount && \
    chmod u-s /usr/bin/chfn && \
    chmod g-s /usr/bin/expiry /usr/bin/chage /usr/sbin/unix_chkpwd && \
    rm -rf /var/lib/apt/lists

COPY --from=builder /my_fcgi_mini_server /server/my_fcgi_mini_server

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /server/my_fcgi_mini_server && chown nginx:nginx /server/my_fcgi_mini_server

USER nginx

ENV DOCKER_CONTENT_TRUST=1

HEALTHCHECK NONE

CMD ["sh", "-c", "spawn-fcgi -a 127.0.0.1 -p 8080 /server/my_fcgi_mini_server && nginx -g 'daemon off;'"]