FROM ubuntu:18.04

RUN mkdir /workdir
WORKDIR /workdir
COPY script.sh .
ENV NAME Greg
RUN chmod +x script.sh

ENTRYPOINT ["/bin/bash", "./script.sh"]
