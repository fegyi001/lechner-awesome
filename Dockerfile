FROM fegyi001/nginx-secure:1.29.2-0

ARG APP_NAME="lechner-awesome"

RUN apk update \
  && apk upgrade

COPY  ./dist/${APP_NAME}/browser /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 8080
