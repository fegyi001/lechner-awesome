FROM nginx:1.29.2-alpine

ARG APP_NAME="lechner-awesome"

RUN apk update \
  && apk upgrade

COPY ./dist/${APP_NAME}/browser /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
