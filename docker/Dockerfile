FROM python:alpine

WORKDIR /app

RUN apk --update add --no-cache \
    bash \
    openssh-client && \ 
    pip3 install ansible

ENTRYPOINT tail -F /dev/null