FROM ruby:2.4.2

RUN apt-get update -qq \
    && apt-get install -y build-essential --no-install-recommends libpq-dev nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile

ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

#LABEL maintainer="YOUR NAME <youremail@domain.com>"

ADD . /app
