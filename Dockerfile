ARG NODE_VERSION=latest
FROM microbox/node:$NODE_VERSION
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=$NODE_VERSION

RUN apk add --no-cache --update unzip tzdata libc6-compat && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg

ENV HOME=/root
WORKDIR /root

COPY config /root
ONBUILD COPY dist.zip /root/
CMD /root/bootstrap.sh

# EOF