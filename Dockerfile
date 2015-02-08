
FROM resin/rpi-raspbian:wheezy-2015-01-15

RUN \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get update

RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y oracle-java8-installer &&\
  apt-get clean

RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment


RUN \
 cd \
 wget https://github.com/winder/Universal-G-Code-Sender/releases/download/v1.0.7/UniversalGcodeSender-v1.0.7.zip && \
 unzip UniversalGcodeSender-v1.0.7.zip  


# Define default command.
CMD ["start.sh"]


