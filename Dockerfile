FROM ubuntu
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y softflowd nfdump
ADD scripts /scripts
CMD sh /scripts/start.sh
