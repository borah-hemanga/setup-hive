#/bin/bash

export HADOOP_VERSION=`hadoop version | grep Hadoop | cut -d' ' -f2`
echo "Installed hadoop version:" $HADOOP_VERSION
export HADOOP_ENV_LOC=/usr/local/cellar/hadoop/$HADOOP_VERSION/libexec

$HADOOP_ENV_LOC/sbin/start-all.sh

jps
