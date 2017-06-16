#!/bin/bash
# Author:Zlyang BY 2017-6-18
# Desc: Auto Install jdk 
Log=install.log
date > $_Log

if [ -z "$1" ];then
	
	echo "Please enter $0 \$1 jdk1.8.0_101.tar.gz "
	exit
fi

JAVA_JDK=$1
JAVA_DIR=`echo $1 |sed 's/.tar.gz//g'`


tar zxvf $1 -C /export/servers/

sed -i '/JAVA_HOME/d;/JAVA_BIN/d;/JAVA_OPTS/d' /etc/profile

cat >> /etc/profile <<EOF
export JAVA_HOME=/export/servers/$JAVA_DIR
export JAVA_BIN=/export/servers/$JAVA_DIR/bin
export PATH=\$JAVA_HOME/bin:\$PATH
export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar
export JAVA_OPTS="-Djava.library.path=/usr/local/lib -server -Xms1024m -Xmx2048m -XX:MaxPermSize=256m -Djava.awt.headless=true -Dsun.net.client.defaultReadTimeout=60000 -Djmagick.systemclassloader=no -Dnetworkaddress.cache.ttl=300 -Dsun.net.inetaddr.ttl=300"
export JAVA_HOME JAVA_BIN PATH CLASSPATH JAVA_OPTS
EOF

source /etc/profile

