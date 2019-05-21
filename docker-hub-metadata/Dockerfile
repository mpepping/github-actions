FROM mpepping/pdk-centos:latest as base

FROM base as docker-hub-metadata
LABEL "com.github.actions.name"        = "Docker Hub metadata"
LABEL "com.github.actions.description" = "Update or Set Docker Hub metadata"
LABEL "com.github.actions.icon"        = "box"
LABEL "com.github.actions.color"       = "blue"

LABEL "repository" = "https://github.com/mpepping/github-actions"
LABEL "homepage" = "https://github.com/mpepping/github-actions"
LABEL "maintainer" = "https://github.com/mpepping"

ADD entrypoint.sh  /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]