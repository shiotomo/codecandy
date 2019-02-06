#!/bin/bash

export SECRET_KEY_BASE=`bundle exec rails secret`
bundle exec rails assets:precompile RAILS_ENV=production
bin/webpack
bundle exec rails s -e production
# RAILS_ENV=production bundle exec pumactl start
