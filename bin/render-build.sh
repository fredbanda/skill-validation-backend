#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# Generate migrations for SolidQueue if they don't exist
bundle exec rails generate solid_queue:install

# Run migrations
bundle exec rake db:migrate