#!/bin/sh
set -e

bundle exec rake create_list_tasks:recreate_lists_and_tasks
