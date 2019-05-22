FROM alpine:3.9 as base

FROM base as docker-hub-metadata
LABEL "com.github.actions.name"        = "Docker Hub metadata"
LABEL "com.github.actions.description" = "Update or Set Docker Hub metadata"
LABEL "com.github.actions.icon"        = "box"
LABEL "com.github.actions.color"       = "blue"

LABEL "repository" = "https://github.com/mpepping/github-actions"
LABEL "homepage" = "https://github.com/mpepping/github-actions"
LABEL "maintainer" = "https://github.com/mpepping"

RUN apk add --update \
    bash \
    curl \
 && rm -rf /var/cache/apk/*
ADD entrypoint.sh  /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
