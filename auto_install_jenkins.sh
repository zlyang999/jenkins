#!/bin/bash 
# Author:Zlyang by 2017-06-18
### Auto install jenkins
#set -e
JDK_FILE=`ls ./1_jdk |egrep ".tar.gz"`
TOMCAT_FILE=`ls ./2_tomcat |egrep ".tar.gz"`
JK_FILE=`ls ./3_jenkins |egrep ".war"`
GIT_FILE=`ls ./4_git |egrep ".tar.gz"`
MVN_FILE=`ls ./5_maven |egrep ".tar.gz"`
if [[ -z ${JDK_FILE} ]];then
	echo -e "\033[31m Error: Please download \033[0m \033[33mJDK \033[0m \033[31mand put it in the \"1_jdk\" dirctory! \033[0m"
elif [[ -z ${TOMCAT_FILE} ]];then
	echo -e "\033[31m Error: Please download \033[0m \033[33mTomcat \033[0m \033[31mand put it in the \"2_tomcat\" dirctory! \033[0m"
elif [[ -z ${JK_FILE} ]];then
	echo -e "\033[31m Error: Please download \033[0m \033[33mJenkins.war \033[0m \033[31mand put it in the \"3_jenkins\" dirctory! \033[0m"
	echo -e "\033[31m Use Wget: \033[33mwget http://mirrors.jenkins.io/war/2.66/jenkins.war -P ./3_jenkins/\033[0m"
elif [[ -z ${GIT_FILE} ]];then
	echo -e "\033[31m Error: Please download \033[0m \033[33mGit \033[0m \033[31mand put it in the \"4_git\" dirctory! \033[0m"
elif [[ -z ${MVN_FILE} ]];then
	echo -e "\033[31m Error: Please download \033[0m \033[33mMaven \033[0m \033[31mand put it in the \"5_maven\" dirctory! \033[0m"
else
	#### Install JDK
	echo "# Install ${JDK_FILE}"
	#cd ./1_jdk ;/bin/sh auto_install_jdk.sh ${JDK_FILE}
	if [ $? == 0 ];then
		echo -e "\033[32m JDK install Success !\033[0m"
	else
		echo -e "\033[31m JDK install Failed ! \033[0m"
	fi
	#### Install Tomcat 
	echo "# Install ${TOMCAT_FILE}"
    #cd ./2_tomcat ;/bin/sh auto_install_tomcat.sh ${TOMCAT_FILE}
    if [ $? == 0 ];then
        echo -e "\033[32m Tomcat install Success !\033[0m"
    else
        echo -e "\033[31m Tomcat install Failed ! \033[0m"
    fi
	#### Insstall Jenkins
	echo "# Install ${JK_FILE}"
    #cd ./3_jenkins ;/bin/sh auto_install_jenkins.sh ${JK_FILE}
    if [ $? == 0 ];then
        echo -e "\033[32m Jenkins install Success !\033[0m"
    else
        echo -e "\033[31m Jenkins install Failed ! \033[0m"
    fi
	#### Install git
	echo "#Install ${GIT_FILE}"
    #cd ./4_git ;/bin/sh auto_install_git.sh ${GIT_FILE}
    if [ $? == 0 ];then
        echo -e "\033[32m Git install Success !\033[0m"
    else
        echo -e "\033[31m Git install Failed ! \033[0m"
    fi
    #### Install Maven
	echo "# Install ${MVN_FILE}"
    #cd ./5_maven ;/bin/sh auto_install_maven.sh ${MVN_FILE}
    if [ $? == 0 ];then
        echo -e "\033[32m Maven install Success !\033[0m"
    else
        echo -e "\033[31m Maven install Failed ! \033[0m"
    fi
fi
