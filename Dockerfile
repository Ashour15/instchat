FROM ruby:2.7.4

RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
  curl gnupg2 apt-utils default-libmysqlclient-dev git libcurl3-dev cmake \
  libssl-dev pkg-config openssl imagemagick file nodejs yarn


RUN mkdir /myapp
WORKDIR /myapp
ENV BUNDLE_PATH /gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /myapp

EXPOSE 3000
