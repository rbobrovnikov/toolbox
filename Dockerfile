FROM alpine:latest
LABEL author="Ruslan Bobrovnikov <ruslan.bobrovnikov@gmail.com>"

ARG KUBECTL_VERSION=1.19.4

RUN apk add --update --no-cache openssl curl jq bash bash-completion openssh-client postgresql-client

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl