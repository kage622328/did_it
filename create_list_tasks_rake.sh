#!/bin/sh
set -e

rake create_list_tasks:recreate_lists_and_tasks >> log/cron.log 2>&1
