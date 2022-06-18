FROM python:alpine3.16

LABEL maintainer="Ian Belcher <github.com@ianbelcher.me>, Alex Zhang <alex.zhang@softgridinc.com>"

ENV PYTHONIOENCODING=UTF-8

RUN apk add --no-cache curl

RUN pip install awscli
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]