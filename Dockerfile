FROM jboss/base-jdk:8

ENV JGROUPS_VERSION 3.6.10.Final 

ENV JGROUPS_SHA1 fc0ff5a8a9de27ab62939956f705c2909bf86bc2

RUN curl -o jgroups.jar https://repo1.maven.org/maven2/org/jgroups/jgroups/$JGROUPS_VERSION/jgroups-$JGROUPS_VERSION.jar \ 
    && sha1sum jgroups.jar | grep $JGROUPS_SHA1

EXPOSE 12001

CMD ["java","-classpath","jgroups.jar","org.jgroups.stack.GossipRouter","-port","12001"]

