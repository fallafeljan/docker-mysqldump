FROM minio/mc:latest

RUN apk update && \
  apk add mariadb-client

ADD crontab /etc/cool-cron
RUN chmod 0644 /etc/cool-cron
RUN crontab /etc/cool-cron

ADD job.sh /usr/local/bin/job.sh
RUN chmod +x /usr/local/bin/job.sh

ADD setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

RUN touch /var/log/cron.log

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["/usr/sbin/crond", "-f", "-d", "0"]
