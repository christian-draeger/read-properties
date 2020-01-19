FROM alpine:3.11
COPY entrypoint.sh /usr/bin/
RUN apk add --no-cache bash
RUN ln -s /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]