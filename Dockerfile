FROM phusion/baseimage:0.9.10
MAINTAINER Victor Lin <bornstub@gmail.com>

RUN adduser --disabled-password --gecos "" foobar
RUN mkdir -p /etc/service/demo
RUN echo "#!/bin/sh\nexec /sbin/setuser foobar /bin/sh -c \"while :; do date >> /data/date 2>&1; sleep 1; done\"" > /etc/service/demo/run
RUN chmod +x /etc/service/demo/run
RUN mkdir /data
RUN chown foobar /data

VOLUME ["/data"]
CMD ["/sbin/my_init", "--", "bash"]
