ARG NGINX_VERSION="1.29.2-0"

FROM fegyi001/nginx-secure:${NGINX_VERSION}

ARG APP_NAME="lechner-awesome"

COPY --chown=nginx:nginx ./dist/${APP_NAME}/browser /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 8080
