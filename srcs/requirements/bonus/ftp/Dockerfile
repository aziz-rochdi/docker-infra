FROM alpine:latest

ARG FTP_USER \
    FTP_PASSWORD

RUN apk update && apk add --no-cache vsftpd bash openssl

RUN adduser -D -h /var/www/html -s /bin/bash ${FTP_USER} \
    && echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd


RUN mkdir -p /etc/vsftpd/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/vsftpd/ssl/vsftpd.pem \
    -out /etc/vsftpd/ssl/vsftpd.pem -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=arochdi.com"

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21100-21110

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
