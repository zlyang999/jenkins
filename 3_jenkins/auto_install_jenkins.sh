#!/bin/bash
# Author:Zlyang by 2017-06-18
# Desc: Auto install jenkins
FILE=$1
TOMCAT_HOME='/export/servers/tomcat-9.0.0.M21'
WEB_HOME='/export/servers/tomcat-9.0.0.M21/webapps/ROOT'

if [[ -z "$FILE" ]];then
	echo -e "\033[31m Error:Please enter jenkins package,Example: $0 jenkins.war \033[0m"
fi
#
#
#Install jenkins
#
#
if [[ -e ${WEB_HOME} ]];then
	rm -rf ${WEB_HOME}/*
	cp $1 ${WEB_HOME}/;cd ${WEB_HOME}/;jar -xf $1
	
else
	echo -e "Error: Tomcat install Error! Please check Tomcat!"
fi

