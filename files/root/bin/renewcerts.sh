#!/bin/sh

cd /root/matomo-docker

echo "Renewing Let's Encrypt Certificates... (`date`)"
docker compose run --rm --no-deps --no-TTY cert renew --no-random-sleep-on-renew
echo "Reloading Nginx configuration"
docker compose exec --no-TTY web nginx -s reload
