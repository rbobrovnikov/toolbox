FROM alpine:latest
MAINTAINER Ruslan Bobrovnikov <ruslan.bobrovnikov@gmail.com>

ARG KUBECTL_VERSION=1.17.7

RUN apk add --update --no-cache curl jq bash bash-completion

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

USER 65534
