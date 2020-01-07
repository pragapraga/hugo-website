FROM alpine:latest
EXPOSE 1313
RUN apk update && apk add git go hugo
RUN hugo new site site
COPY nginx/nginx.conf /etc/nginx/nginx.conf
WORKDIR /site
# COPY config.toml config.toml
RUN git init && \
 git clone https://github.com/yaguetto/hugo-theme-hello-friend-ng themes/hello-friend-ng/ && \
 hugo
ENTRYPOINT [ "hugo", "server", "--bind=hugo", "--baseUrl=http://yaguetto.tech/" ]

