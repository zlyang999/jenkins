#!/bin/bash
# Author:Zlyang 2017-06-18
# Desc: Auto Install apache-maven
FILE=$1
WORK='/export/servers'
ANT_TMP=`echo $1|sed 's/-bin.tar.gz//g'`
ANT_NAME=`echo $1|sed 's/.tar.gz//g'|cut -d"-" -f2-3`
ANT_HOME="${WORK}/${ANT_NAME}"
if [[ -z "$FILE" ]];then
	echo -e "\033[31m Error:Please enter ANT package,Example: $0 apache-ant-1.10.1-src.tar.gz \033[0m"
fi
#
# Install Apache-Ant
#
tar xf $1 ;mv ${ANT_TMP} ${ANT_NAME};mv ${ANT_NAME} ${WORK}/
#
# Config Ant
#
if [[ $? == 0 ]];then
	echo -e "\033[32m Ant Install Success ! \033[0m"
cat >> /etc/profile <<EOF
export ANT_HOME=$ANT_HOME
export PATH=\$PATH:${ANT_HOME}/bin
EOF
	sleep 1
	source /etc/profile
else
	echo -e "\033[31m Error: Please check install !\033[0m"
fi

##### End #####

