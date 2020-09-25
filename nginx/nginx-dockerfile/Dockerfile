#name of container: docker-nginx
FROM ubuntu:18.04

# Necessary for add-apt-repository
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

RUN apt-get -y --quiet --no-install-recommends install apt-transport-https
RUN add-apt-repository -y ppa:nginx/development
RUN apt-get update 

RUN apt-get -y --quiet --allow-unauthenticated --no-install-recommends install \
					nginx \
                    && apt-get clean \
                    && rm -rf /tmp/* /var/tmp/*  \
                    && rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/lib/nginx

# This will allow nginx to "write" its logs to stdout.  Needed to use the host syslog.
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /etc/nginx

EXPOSE 80

CMD ["nginx"]
