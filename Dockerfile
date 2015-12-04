FROM jboss/base-jdk:8

ENV JGROUPS_VERSION 3.6.4.Final

RUN curl https://repo1.maven.org/maven2/org/jgroups/jgroups/$JGROUPS_VERSION/jgroups-$JGROUPS_VERSION.jar > jgroups.jar

EXPOSE 12001

CMD ["java","-classpath","jgroups.jar","org.jgroups.stack.GossipRouter","-port","12001"]

