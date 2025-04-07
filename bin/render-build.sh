#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# Only uncomment this line for one deployment, then comment it out again
bundle exec rails g solid_queue:install
bundle exec rake db:migrate