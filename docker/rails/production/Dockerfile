FROM ruby:2.6.0-alpine

RUN mkdir /app
ENV HOME /app
ENV RAILS_ENV production
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
RUN npm install -g yarn
RUN yarn install
RUN n latest

# ADD Gemfile /app/Gemfile
# ADD Gemfile.lock /app/Gemfile.lock
# # Using hosts cache
# ADD vendor/bundle /app/vendor/bundle

RUN bundle install --jobs=4 --path=vendor/bundle
# RUN bundle exec rails db:setup RAILS_ENV=production

# RUN bin/webpack
# RUN bundle exec rails assets:precompile RAILS_ENV=production
# CMD export SECRET_KEY_BASE=`bundle exec rails secret`
# CMD bundle exec rails s -b=0.0.0.0 -e production
CMD /bin/bash production_server_start.sh
