FROM ruby:2.5.3

ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /event-app
WORKDIR /event-app
ADD Gemfile /event-app/Gemfile
ADD Gemfile.lock /event-app/Gemfile.lock
RUN bundle install
ADD . /event-app
RUN mkdir -p tmp/sockets
