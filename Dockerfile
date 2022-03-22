FROM centos:7
MAINTAINER  xiangsc@digitalchina.com
RUN yum install -y vim wget tree  lrzsz gcc gcc-c++ automake pcre pcre-devel zlib zlib-devel openssl openssl-devel iproute net-tools iotop
ADD nginx-1.18.0.tar.gz /usr/local/src/
RUN cd /usr/local/src/nginx-1.18.0 && ./configure  && make && make install && ln -sv  /usr/local/nginx/sbin/nginx /usr/sbin/nginx  &&rm -rf /usr/local/src/nginx-1.18.0.tar.gz
RUN useradd nginx -s /sbin/nologin
ADD nginx.conf   /usr/local/nginx/conf/nginx.conf
ADD index.html   /usr/local/nginx/html/index.html
EXPOSE 80 443
CMD ["nginx"] 
