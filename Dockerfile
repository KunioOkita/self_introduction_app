FROM ruby:2.6.6

ENV LANG ja_JP.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl

# node.js install
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install v14.17.6 \
    && npm install --global yarn
ENV PATH $PATH:/root/.nvm/versions/node/v14.17.6/bin
RUN echo $PATH

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install \
    && bundle exec rails webpacker:install
ENV RAILS_SERVE_STATIC_FILES true
COPY . /app

EXPOSE 8080

# アプリとWorker両方でDockerfileを兼用するため起動スクリプトを別途実行するようにする
CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8080 -b '0.0.0.0'"