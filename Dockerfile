FROM 848859896798.dkr.ecr.us-east-1.amazonaws.com/base-image-centos:latest
MAINTAINER anuj
ADD target/JavaWebAppExample-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/
RUN chmod +x /opt/tomcat/webapps/JavaWebAppExample-0.0.1-SNAPSHOT.war
