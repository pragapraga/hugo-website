FROM alpine:latest
EXPOSE 80
RUN apk update && apk add git go hugo
RUN hugo new site site
WORKDIR /site
COPY site/ .
RUN git init && \
 git submodule add https://github.com/yaguetto/hugo-theme-hello-friend-ng themes/hello-friend-ng/ && \
 hugo
ENTRYPOINT [ "hugo", "server", "--bind=hugo", "--baseUrl=http://yaguetto.tech/", "--port=80" ]

