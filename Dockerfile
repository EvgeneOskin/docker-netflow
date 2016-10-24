FROM ubuntu
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y wget softflowd nfdump openjdk-8-jdk

# NiFi Controller
ARG NIFI_URL=http://mirrors.koehn.com/apache/nifi/1.0.0/nifi-1.0.0-bin.tar.gz
ARG NIFI_SUBFOLDER=nifi-1.0.0
RUN wget -nv ${NIFI_URL} -O /nifi.tgz
RUN tar -xzvf /nifi.tgz
# HDF is shipped as ${NIFI_SUBFOLDER/nifi}, Apache NiFi is shipped with no subfolder
#RUN mv ${NIFI_SUBFOLDER}/nifi /nifi
RUN mv ${NIFI_SUBFOLDER} /nifi
ADD flow.xml.gz /nifi/conf/

ADD scripts /scripts
CMD sh /scripts/start.sh
