#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Installing gems..."
bundle install

echo "Generating SolidQueue migrations..."
bundle exec rails generate solid_queue:install

echo "Running database migrations..."
bundle exec rails db:migrate

echo "Build completed successfully!"