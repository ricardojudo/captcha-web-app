FROM tomcat:8.5-jre8

RUN rm -rf /usr/local/tomcat/webapps/*
COPY src/docker/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY target/captcha-service.war /usr/local/tomcat/webapps/ROOT.war