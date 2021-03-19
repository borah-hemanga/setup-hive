#bin/bash

# Install hadoop
brew install hadoop

export HADOOP_VERSION=`hadoop version | grep Hadoop | cut -d' ' -f2`
echo "Installed hadoop version:" $HADOOP_VERSION
export HADOOP_ENV_LOC=/usr/local/cellar/hadoop/$HADOOP_VERSION/libexec/etc/hadoop

export JAVA_HOME=`/usr/libexec/java_home`
echo "Found JAVA_HOME:" $JAVA_HOME

export HADOOP_ENV_FILE=hadoop-env.sh
echo "Updating $HADOOP_ENV_FILE file ..."
echo '' > $HADOOP_ENV_LOC/$HADOOP_ENV_FILE
echo 'export JAVA_HOME="'$JAVA_HOME'"' >> $HADOOP_ENV_LOC/$HADOOP_ENV_FILE
echo 'export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true -Djava.security.krb5.realm= -Djava.security.krb5.kdc="' >> $HADOOP_ENV_LOC/$HADOOP_ENV_FILE

export CORE_SITE_FILE=core-site.xml
echo "Updating $CORE_SITE_FILE file ..."
echo '' > $HADOOP_ENV_LOC/$CORE_SITE_FILE
echo "<configuration>"                           >> $HADOOP_ENV_LOC/$CORE_SITE_FILE
echo "  <property>"                              >> $HADOOP_ENV_LOC/$CORE_SITE_FILE
echo "    <name>fs.defaultFS</name>"             >> $HADOOP_ENV_LOC/$CORE_SITE_FILE
echo "    <value>hdfs://localhost:9000</value>"  >> $HADOOP_ENV_LOC/$CORE_SITE_FILE
echo "  </property>"                             >> $HADOOP_ENV_LOC/$CORE_SITE_FILE
echo "</configuration>"                          >> $HADOOP_ENV_LOC/$CORE_SITE_FILE

export HDFS_SITE_FILE=hdfs-site.xml
echo "Updating $HDFS_SITE_FILE file ..."
echo '' > $HADOOP_ENV_LOC/$HDFS_SITE_FILE
echo "<configuration>"                  >> $HADOOP_ENV_LOC/$HDFS_SITE_FILE
echo "  <property>"                     >> $HADOOP_ENV_LOC/$HDFS_SITE_FILE
echo "    <name>dfs.replication</name>" >> $HADOOP_ENV_LOC/$HDFS_SITE_FILE
echo "    <value>1</value>"             >> $HADOOP_ENV_LOC/$HDFS_SITE_FILE
echo "  </property>"                    >> $HADOOP_ENV_LOC/$HDFS_SITE_FILE
echo "</configuration>"                 >> $HADOOP_ENV_LOC/$HDFS_SITE_FILE

export MAPRED_SITE=mapred-site.xml
echo "Updating $MAPRED_SITE file ..."
echo '' > $HADOOP_ENV_LOC/$MAPRED_SITE
echo "<configuration>"                                 >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "  <property>"                                    >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "    <name>mapreduce.framework.name</name>"       >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "    <value>yarn</value>"                         >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "  </property>"                                   >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "  <property>"                                    >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "    <name>mapreduce.application.classpath</name>" >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "    <value>\$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/*:\$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/lib/*</value>" >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "  </property>"                                   >> $HADOOP_ENV_LOC/$MAPRED_SITE
echo "</configuration>"                                >> $HADOOP_ENV_LOC/$MAPRED_SITE

export YARN_SITE=yarn-site.xml
echo '' > $HADOOP_ENV_LOC/$YARN_SITE
echo "Updating $YARN_SITE file ..."
echo "<configuration>"                                  >> $HADOOP_ENV_LOC/$YARN_SITE
echo "  <property>"                                     >> $HADOOP_ENV_LOC/$YARN_SITE
echo "    <name>yarn.nodemanager.aux-services</name>"   >> $HADOOP_ENV_LOC/$YARN_SITE
echo "    <value>mapreduce_shuffle</value>"             >> $HADOOP_ENV_LOC/$YARN_SITE
echo "  </property>"                                    >> $HADOOP_ENV_LOC/$YARN_SITE
echo "  <property>"                                     >> $HADOOP_ENV_LOC/$YARN_SITE
echo "  <name>yarn.nodemanager.env-whitelist</name>"    >> $HADOOP_ENV_LOC/$YARN_SITE
echo "    <value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>" >> $HADOOP_ENV_LOC/$YARN_SITE
echo "  </property>"                                    >> $HADOOP_ENV_LOC/$YARN_SITE
echo "</configuration>"                                 >> $HADOOP_ENV_LOC/$YARN_SITE

