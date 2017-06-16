FROM 848859896798.dkr.ecr.us-east-1.amazonaws.com/base-image-centos:latest
MAINTAINER rashid
ADD target/JavaWebAppExample-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/

