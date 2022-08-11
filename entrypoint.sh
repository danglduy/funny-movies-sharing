#!/bin/bash
# Docker entrypoint script.

bundle check || bundle install
rm tmp/pids/server.pid
bin/dev
