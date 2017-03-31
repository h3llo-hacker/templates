FROM alpine:latest
MAINTAINER wrfly <mr.wrfly@gmail.com>

EXPOSE 22

COPY fc-init.sh /

RUN apk --update add openssh && \
	sed -i "s/#PermitRootLogin.*/PermitRootLogin\ yes/" /etc/ssh/sshd_config && \
	/usr/bin/ssh-keygen -A && \
	rm -rf /var/cache/apk/* && \
	chmod +x /fc-init.sh
CMD ["/fc-init.sh"]
