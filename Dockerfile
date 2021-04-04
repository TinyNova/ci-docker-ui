FROM node:10.16-alpine

RUN wget "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    apk add --update vim make gcc g++ bash groff less python python-dev py-pip git openssh openssl jq libffi-dev ruby && \
    apk add --update tzdata coreutils ca-certificates libpq postgresql-client postgresql-dev docker sudo curl ruby-irb ruby-rdoc && \
    rm /var/cache/apk/* && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle && \
    chmod a+x /usr/local/bin/* && \
    npm install -g @sentry/cli sequelize sequelize-cli elasticulize-cli pg pg-hstore pg-native aws-sdk minimist serverless --unsafe-perm && \
    pip install docker-compose && \
    gem install bundler
