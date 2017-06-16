#!/bin/bash
# Author:Zlyang 2017-06-18
# Desc: Auto Install apache-maven
FILE=$1
WORK='/export/servers'
MAVEN_TMP=`echo $1|sed 's/-bin.tar.gz//g'`
MAVEN_NAME=`echo $1|sed 's/.tar.gz//g'|cut -d"-" -f2-3`
MAVEN_HOME="${WORK}/${MAVEN_NAME}"
if [[ -z "$FILE" ]];then
	echo -e "\033[31m Error:Please enter Maven package,Example: $0 apache-maven-3.5.0-bin.tar.gz \033[0m"
fi
#
# Install Apache-Maven
#
tar xf $1 ;mv ${MAVEN_TMP} ${MAVEN_NAME};mv ${MAVEN_NAME} ${WORK}/
#
# Config Maven
#
if [[ $? == 0 ]];then
	echo -e "\033[32m Maven Install Success ! \033[0m"
cat >> /etc/profile <<EOF
export MAVEN_HOME=$MAVEN_HOME
export PATH=\$PATH:${MAVEN_HOME}/bin
EOF
source /etc/profile
else
	echo -e "\033[31m Error: Please check install !\033[0m"
fi
##### End #####

