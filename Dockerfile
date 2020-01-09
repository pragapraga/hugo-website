FROM alpine:latest as hugo
EXPOSE 80
EXPOSE 443
RUN apk update && apk add git hugo
RUN hugo new site site
WORKDIR /site
COPY site/ .
RUN git init && \
 git submodule add https://github.com/yaguetto/hugo-theme-hello-friend-ng themes/hello-friend-ng/ && \
 hugo
FROM nginx
COPY --from=hugo /site/public /var/www/site/public
COPY ./nginx/nginx.conf /etc/nginx/conf.d/nginx.conf
WORKDIR /var/www/site

