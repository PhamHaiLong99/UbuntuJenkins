FROM unbuntu
RUN echo "hello"

COPY entry-point.sh /entry-point.sh
WORKDIR /
ENTRYPOINT /entry-point.sh