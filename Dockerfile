
FROM resin/rpi-raspbian:wheezy-2015-01-15


RUN echo 'deb http://archive.raspberrypi.org/debian/ wheezy main' >> /etc/apt/sources.list.d/raspi.list
ADD ./raspberrypi.gpg.key /key/
RUN apt-key add /key/raspberrypi.gpg.key
RUN apt-get update

RUN apt-get -y install wget
RUN apt-get -y install unzip
RUN apt-get -y install ca-certificates

RUN \
 cd ~ && \
 wget https://github.com/winder/Universal-G-Code-Sender/releases/download/v1.0.7/UniversalGcodeSender-v1.0.7.zip && \
 ls -latr && \
 unzip UniversalGcodeSender-v1.0.7.zip  

#RUN apt-get -y upgrade
RUN echo oracle-java8-jdk shared/accepted-oracle-license-v1-1 select true| /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-jdk 
RUN apt-get clean

RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment




CMD ["/bin/bash", "-ex", "start.sh"]
