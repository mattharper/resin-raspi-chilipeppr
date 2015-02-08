
FROM resin/rpi-raspbian:wheezy-2015-01-15

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


RUN \
 cd \
 wget https://github.com/winder/Universal-G-Code-Sender/releases/download/v1.0.7/UniversalGcodeSender-v1.0.7.zip && \
 unzip UniversalGcodeSender-v1.0.7.zip  


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["start.sh"]


