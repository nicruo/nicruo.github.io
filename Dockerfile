#Create a Jekyll container
FROM ruby:2.7.4-alpine3.14

RUN apk update
RUN apk add --no-cache build-base gcc cmake git

RUN gem update bundler && gem install bundler

