FROM tomcat:8.5-jre8


COPY src/docker/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY target/captcha-service.war /usr/local/tomcat/webapps/captcha-service.war