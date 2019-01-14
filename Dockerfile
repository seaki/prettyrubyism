FROM ruby:alpine
ENV LANG ja-JP.UTF-8
RUN apk update
RUN apk upgrade
RUN apk add --update --no-cache --virtual=build-dependencies build-base
RUN gem install coveralls rubocop rspec
RUN gem install --development rubicure
CMD ["irb", "-I", "lib/", "-rprettyrubyism"]
