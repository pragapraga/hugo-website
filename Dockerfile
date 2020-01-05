FROM alpine:latest
EXPOSE 1313:1313
RUN apk update && apk add git go hugo
RUN hugo new site site
COPY nginx/nginx.conf /etc/nginx/nginx.conf
WORKDIR /site
# COPY config.toml config.toml
# RUN git init && git submodule add https://github.com/rhazdon/hugo-theme-hello-friend-ng themes/hello-friend-ng
ENTRYPOINT [ "hugo", "server", "-D", "--bind=hugo" ]