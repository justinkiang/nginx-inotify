#!/bin/sh

set -e

watch-config.sh &


if [ ! -f /config/live/site.conf ]; then
    echo "No site conf found yet, let's sleep for 10 seconds to see if green-blue deployment is still working"
    sleep 10
    echo "Alright, let's try again"
fi

cmp -s /config/live/site.conf /etc/nginx/conf.d/site.conf || cp -rf /config/live/site.conf /etc/nginx/conf.d/site.conf

exec "$@"