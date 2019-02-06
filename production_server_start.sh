#!/bin/bash

export SECRET_KEY_BASE=`bundle exec rails secret`
bundle exec rails assets:precompile RAILS_ENV=production
bin/webpack
bundle exec rails s -b=0.0.0.0 -e production
# RAILS_ENV=production bundle exec pumactl start
