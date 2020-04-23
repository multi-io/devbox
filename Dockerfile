FROM ubuntu:20.04
MAINTAINER Olaf Klischat <olaf.klischat@gmail.com>

COPY bootstrap.sh /setup.sh

RUN chmod ugo+x /setup.sh && sync && /setup.sh

