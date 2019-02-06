FROM ruby:2.6.0-alpine

RUN mkdir /app
ENV HOME /app
WORKDIR $HOME
ADD . /app

RUN apk add -U --no-cache \
  bash \
  fontconfig \
  postgresql-client postgresql-dev \
  git \
  alpine-sdk \
  nodejs \
  npm \
  docker \
  tzdata

RUN npm update -g npm
RUN npm install -g n
RUN n latest
RUN npm install -g yarn
RUN yarn install

# ADD Gemfile /app/Gemfile
# ADD Gemfile.lock /app/Gemfile.lock
# # Using hosts cache
# ADD vendor/bundle /app/vendor/bundle

RUN bundle install --jobs=4 --path=vendor/bundle

CMD bundle exec foreman start
