# Hello:
	看到这里想必您已经看了我写的部署方案及教程，本工具包中包含多个应用软：Tomcat、JDK、Git、Maven、Jenkins。
具体的部署顺序我已经在文件夹中注明，在此再次声明部署顺序及方法：
	1、部署顺序：
		首先部署JDK
		其次是Tomcat
		再次是Jenkins
		再次是Git
		最后部署Maven
	2、使用方法：
		sh [自动部署脚本] [安装包全称]
		例：sh auto_install_tomcat.sh apache-tomcat-9.0.0.M21.tar.gz
	3、启动jenkins
		sh start.sh

感谢您的支持！如有问题请联系：DBA_Master@163.com
