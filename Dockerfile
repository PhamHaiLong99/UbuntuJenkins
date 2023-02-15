FROM ubuntu
COPY entry-point.sh /entry-point.sh
WORKDIR /
ENTRYPOINT /entry-point.sh