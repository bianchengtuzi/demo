#FROM harbor-cicd.apps.com/library/tomcat:v0
FROM docker.io/tomcat:8.5-alpine
RUN rm -rf /usr/local/tomcat/webapps/* && chmod 777 -R /usr/local/tomcat/webapps/
RUN rm -rf /temp/jeesite/ehcache && mkdir -p /temp/jeesite/ehcache && chmod 777 -R /temp/jeesite/ehcache/
ADD ./jeesite.war /usr/local/tomcat/webapps/jeesite.war
WORKDIR /usr/local/tomcat/bin
EXPOSE 8080 
CMD ["catalina.sh", "run"] 

