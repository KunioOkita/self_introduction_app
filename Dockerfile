FROM ruby:2.6.6

ENV LANG ja_JP.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
ENV RAILS_SERVE_STATIC_FILES true

COPY . /app

EXPOSE 8080

# アプリとWorker両方でDockerfileを兼用するため起動スクリプトを別途実行するようにする
CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8080 -b '0.0.0.0'"