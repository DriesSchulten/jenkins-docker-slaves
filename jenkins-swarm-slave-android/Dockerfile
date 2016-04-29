FROM jenkins-swarm-slave-base

USER root

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && apt-get clean

RUN apt-get update && apt-get install -y openjdk-7-jdk && rm -rf /var/lib/apt/lists/*
ENV JAVA8_HOME $JAVA_HOME
ENV JAVA7_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R jenkins-slave:jenkins-slave android-sdk-linux && chmod -R 755 android-sdk-linux

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN ls -latr $ANDROID_HOME

USER jenkins-slave

RUN echo "y" | android update sdk --all --no-ui --filter platform-tools,build-tools-23.0.3,android-23,extra-android-support,extra-android-m2repository,extra-google-m2repository

RUN which adb
RUN which android

USER root

RUN echo ANDROID_HOME="$ANDROID_HOME" >> /etc/environment