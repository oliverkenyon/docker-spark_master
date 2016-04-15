FROM chooban/spark_base:latest

COPY conf/* /usr/local/spark/conf/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /tmp/spark-events/
WORKDIR /usr/local/spark

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
