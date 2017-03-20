FROM nginx:alpine

RUN apk update && apk add inotify-tools

COPY . /opt/haproxy

ENV PATH="/opt/haproxy/bin:$PATH"

EXPOSE 80 443

ENTRYPOINT ["entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]