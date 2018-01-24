FROM node:6.12.3-alpine

RUN wget "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    apk add --update make gcc g++ bash groff less python python-dev py-pip git openssh openssl && \
    apk add --update ca-certificates libpq postgresql-client postgresql-dev docker sudo curl && \
    rm /var/cache/apk/* && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle && \
    pip install docker-compose
