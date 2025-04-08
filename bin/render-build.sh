#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
#bundle exec rails solid_queue:install:migrations
bundle exec rake db:migrate