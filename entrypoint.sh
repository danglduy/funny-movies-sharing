#!/bin/bash
# Docker entrypoint script.

bundle check || bundle install
rm tmp/pids/server.pid
bundle exec rails s -b 0.0.0.0
