FROM centos:8
LABEL Maintainer=Manish Mail=manngupta@xxx.com
RUN yum install -y java wget
RUN adduser tomcat -d /opt/app
USER tomcat
WORKDIR /opt/app
ARG downloadLink
ARG tomcatVersion
RUN wget ${downloadLink} && tar -xvf apache-tomcat-${tomcatVersion}.tar.gz && rm -rf apache-tomcat-${tomcatVersion}.tar.gz
COPY start-tomcat.sh .
WORKDIR /opt/app/apache-tomcat-${tomcatVersion}/logs
ENV TOMCAT_HOME /opt/app/apache-tomcat-${tomcatVersion}
CMD ["sh","../../start-tomcat.sh"]
