#!/bin/sh

set -e

watch-config.sh &

cp /config/live/${APP_NAME}/site.conf /etc/nginx/conf.d/site.conf
exec "$@"