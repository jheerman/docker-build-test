FROM ubuntu:24.04

ARG TARGET_ENVIRONMENT
ARG VERSION
ARG FILE_NAME

ENV SECURITY_PATH="/security/${TARGET_ENVIRONMENT}"

RUN mkdir -p $SECURITY_PATH
COPY $FILE_NAME $SECURITY_PATH

RUN --mount=type=secret,id=secret_1 \
    cat /run/secrets/secret_1 > $SECURITY_PATH/secret_1.txt

RUN --mount=type=secret,id=secret_2 \
    cat /run/secrets/secret_2 > $SECURITY_PATH/secret_2.txt

ENTRYPOINT ["tail", "-f", "/dev/null"]
