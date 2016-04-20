FROM oliverkenyon/spark_base:latest

COPY conf/* /usr/local/spark/conf/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /tmp/spark-events/
WORKDIR /usr/local/spark

COPY conf-hadoop/* /usr/local/hadoop/etc/hadoop/
RUN mkdir -p $HADOOP_HOME/hadoop_data/hdfs/namenode
RUN touch $HADOOP_CONF_DIR/masters
RUN echo spark-master > $HADOOP_CONF_DIR/masters
RUN echo -e spark-worker $HADOOP_CONF_DIR/slaves
RUN $HADOOP_HOME/bin/hdfs namenode -format

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
