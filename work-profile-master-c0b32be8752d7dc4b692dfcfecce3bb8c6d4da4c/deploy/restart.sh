#!/bin/bash
set -e
docker restart mysql
docker restart nginx
sleep 30
docker restart connect
docker restart redis-cluster
docker restart authority
sleep 30
docker restart dataworks
docker restart matsu
docker restart meteor
sleep 30
docker restart tenma
docker restart databus
