FROM ruby:2-alpine
LABEL "maintainer"="bpicode"

LABEL "com.github.actions.name"="github-action-fpm"
LABEL "com.github.actions.description"="Build packages for multiple platforms using github.com/jordansissel/fpm"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

RUN apk --no-cache add build-base
RUN apk --no-cache add rpm
RUN apk --no-cache add tar
RUN apk --no-cache add zip
# for pacman
RUN apk --no-cache add libarchive-tools
RUN apk --no-cache add zstd
RUN gem install --no-document fpm -v 1.14.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
