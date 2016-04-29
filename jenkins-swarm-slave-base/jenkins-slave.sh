#!/bin/bash

function append() {
  if [ -n "$2" ]; then
  OPTS="$OPTS \
  $1 $2"
  fi
}

JENKINS_HOME=/home/jenkins-slave

OPTS=

append "-master" $MASTER_URL
append "-executors" $EXECUTORS
append "-fsroot" $JENKINS_HOME
append "-labels" \"$LABELS\"
append "-name" $JENKINS_SLAVE_NAME
append "-username" $JENKINS_USERNAME
append "-password" $JENKINS_PASSWORD

JAR=`ls -1 /usr/share/jenkins/swarm-client-*.jar | tail -n 1`
java -jar $JAR $OPTS
w