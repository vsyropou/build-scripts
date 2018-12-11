FROM alpine:latest

RUN apk add --no-cache bash rsync openssh

RUN mkdir -p /rsnapshot/system-backup

ENTRYPOINT /bin/bash
