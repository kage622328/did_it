#!/bin/sh
set -e

export RAILS_ENV=production

bundle exec rake create_list_tasks:recreate_lists_and_tasks
