ARG NGINX_VERSION="1.29.2-0"

FROM fegyi001/nginx-secure:${NGINX_VERSION}

ARG APP_NAME="lechner-awesome"

RUN apk update \
  && apk upgrade

COPY --chown=nginx:nginx ./dist/${APP_NAME}/browser /usr/share/nginx/html
COPY --chown=nginx:nginx ./nginx/docker-nginx-default.conf /etc/nginx/templates/default.conf.template
COPY --chown=nginx:nginx ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx ./nginx/50x.html /usr/share/nginx/html/50x.html
COPY --chown=nginx:nginx ./nginx/404.html /usr/share/nginx/html/404.html

RUN chown -R nginx:nginx /var/cache/nginx && \
  chown -R nginx:nginx /var/log/nginx && \
  chown -R nginx:nginx /etc/nginx/templates && \
  chown -R nginx:nginx /etc/nginx/conf.d && \
  touch /var/run/nginx.pid && \
  mkdir -p /app/cache && \
  chown -R nginx:nginx /app/cache && \
  chown -R nginx:nginx /var/run/nginx.pid

ENV LOG_FORMAT=main_json

USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
