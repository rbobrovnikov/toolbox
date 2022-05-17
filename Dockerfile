FROM alpine:latest
LABEL author="Ruslan Bobrovnikov <ruslan.bobrovnikov@gmail.com>"
#
# ARG KUBECTL_VERSION=1.19.4

RUN apk add --update --no-cache \
    openssl \
    curl \
    jq \
    bash \
    bash-completion \
    openssh-client \
    postgresql-client \
    mongodb-tools \
    bind-tools \
    busybox-extras && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN curl -s -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o 65534 -g 65534 -m 0755 kubectl /usr/local/bin/kubectl
    # mv kubectl /usr/bin/kubectl && \
    # chmod +x /usr/bin/kubectl

USER 65534
