# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER anuj


# Install prepare infrastructur
RUN yum clean all
RUN  yum -y update  && \
yum -y install wget && \
yum -y install tar

# Prepare environment
ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Install Oracle Java8
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz && \
tar -xvf jdk-8u131-linux-x64.tar.gz && \
rm jdk*.tar.gz && \
mv jdk* ${JAVA_HOME}

RUN wget http://apache.mirrors.ionfish.org/tomcat/tomcat-7/v7.0.78/bin/apache-tomcat-7.0.78.tar.gz && \
tar -xzf apache-tomcat-7.0.78.tar.gz && \
tar -xvf apache-tomcat*.tar.gz && \
rm apache-tomcat*.tar.gz && \
mv apache-tomcat* ${CATALINA_HOME}


RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Create Tomcat admin user
ADD create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
ADD tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
RUN chmod +x $CATALINA_HOME/scripts/*.sh

# Create tomcat user
RUN groupadd -r tomcat && \
useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
chown -R tomcat:tomcat ${CATALINA_HOME}

#Adding War File
#ADD JavaWebAppExample.war /usr/local/tomcat/webapps/
#ADD JavaWebAppExample.war /usr/local/tomcat/webapps/
#RUN chmod +x /usr/local/tomcat/webapps/JavaWebAppExample-0.0.1-SNAPSHOT.war

ADD target/JavaWebAppExample-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/
RUN chmod +x /opt/tomcat/webapps/JavaWebAppExample-0.0.1-SNAPSHOT.war

WORKDIR /opt/tomcat

EXPOSE 8080
EXPOSE 8009

USER tomcat
CMD ["tomcat.sh"]
