#!/bin/bash
# Author:Zlyang 2017-06-18
# Desc: Auto Install git
export PATH=$PATH
FILE=$1
GIT_DIR=`echo $1|sed 's/.tar.gz//g'`
WORK="/export/servers"
if [[ -z "$FILE" ]];then
	echo -e "\033[31m Error:Please enter Git package,Example: $0 git-2.9.4.tar.gz \033[0m"
fi
#
#
# Install Yum  
# 
yum -y install epel-release
# Install Git 
#
yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
tar xf $1;cd ${GIT_DIR};make -j 20 prefix=${WORK}/${GIT_DIR} all;make prefix=${WORK}/${GIT_DIR} install
cat >>/etc/profile <<EOF
export GIT_HOME=${WORK}/${GIT_DIR}
export PATH=${GIT_HOME}/bin:\$PATH
EOF
source /etc/profile
cd ../;/bin/rm -rf ./${GIT_DIR}
