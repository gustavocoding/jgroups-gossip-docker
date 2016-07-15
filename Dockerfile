FROM alpine:3.3

MAINTAINER gustavonalle

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && apk add --update openjdk8 curl && rm /var/cache/apk/*

ENV JGROUPS_VERSION 3.6.10.Final 

RUN curl https://repo1.maven.org/maven2/org/jgroups/jgroups/$JGROUPS_VERSION/jgroups-$JGROUPS_VERSION.jar > jgroups.jar

EXPOSE 12001

CMD ["java","-classpath","jgroups.jar","org.jgroups.stack.GossipRouter","-port","12001"]

