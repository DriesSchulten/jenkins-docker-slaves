from jenkins-swarm-slave-base

USER root

ENV SBT_VERSION  0.13.8
ENV SBT_JAR      https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar

ADD  $SBT_JAR  /usr/local/bin/sbt-launch.jar
COPY sbt.sh    /usr/local/bin/sbt

RUN sbt
RUN chmod a+rx /usr/local/bin/sbt-launch.jar
RUN ls -latr /usr/local/bin

# Add-on docker
RUN curl -sSL https://get.docker.com/ | sh
ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker

RUN usermod -a -G docker jenkins-slave

ADD jenkins-slave-docker.sh / 
ENTRYPOINT ["/jenkins-slave-docker.sh"]

