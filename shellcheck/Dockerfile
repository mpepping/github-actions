FROM koalaman/shellcheck-alpine as base

FROM base as shellcheck
LABEL "com.github.actions.name"        = "ShellCheck"
LABEL "com.github.actions.description" = "Run shellcheck on all shell scripts in the repository"
LABEL "com.github.actions.icon"        = "box"
LABEL "com.github.actions.color"       = "green"

LABEL "repository" = "https://github.com/mpepping/github-actions"
LABEL "homepage"   = "https://www.shellcheck.net"
LABEL "maintainer" = "https://github.com/mpepping"

ADD entrypoint.sh  /entrypoint.sh
RUN apk add --no-cache bash ; \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]