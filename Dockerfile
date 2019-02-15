FROM tomee:8-jre-7.0.5-plus

RUN mkdir -p /Database/FirstDB

COPY ./Database/ /Database/
COPY ./webapps/ /usr/local/tomee/webapps/
COPY ./lib/ /usr/local/tomee/lib/
COPY ./conf/tomee.xml /usr/local/tomee/conf/

VOLUME ["/Database","/usr/local/tomee/webapps","/usr/local/tomee/lib","/usr/local/tomee/conf"]