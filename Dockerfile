FROM microbox/node:6.11.4
RUN apk add --update unzip libc6-compat tzdata && rm -rf /var/cache/apk/*
COPY config /root
ONBUILD COPY dist.zip /root/
WORKDIR /root
CMD /root/bootstrap.sh
