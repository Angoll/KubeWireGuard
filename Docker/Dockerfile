FROM alpine:3

RUN apk update && \
	apk upgrade && \
	apk add --no-cache procps iptables wireguard-tools

COPY /docker-entrypoint.sh /docker-entrypoint.sh

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

EXPOSE 51820
ENTRYPOINT /docker-entrypoint.sh

CMD ["/bin/sh"]
