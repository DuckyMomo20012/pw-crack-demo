FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git make libssl-dev libssh-dev libidn11-dev libpcre3-dev \
                 libgtk2.0-dev default-libmysqlclient-dev libpq-dev libsvn-dev \
                 firebird-dev libmemcached-dev libgpg-error-dev \
                 libgcrypt20-dev
RUN apt-get install -y openssh-server
RUN systemctl start ssh
EXPOSE 22
RUN git clone https://github.com/vanhauser-thc/thc-hydra
RUN cd ./thc-hydra && ./configure && make && make install
