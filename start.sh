#!/bin/bash
# Author:Zlyang BY 2017-06-18
# Desc: Start Tomcat

TOMCAT_HOME=${TOMCAT_HOME:-/export/servers/tomcat-9.0.0.M21}
TOMCAT_BIN=${TOMCAT_BIN:-"/export/servers/tomcat-9.0.0.M21/bin"}
if [[ ! -z $TOMCAT_BIN ]];then
	cd $TOMCAT_BIN;/bin/sh startup.sh
	if [[ $? == 0 ]];then
		echo -e "\033[32m Tomcat Start Success \033[0m!"
	else
		echo -e "\033[31m Tomcat Start Failed \033[0m!"
	fi
else
	echo -e "\033[31m Error:Please check Install Tomcat ! \033[0m"
fi
