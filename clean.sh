#!/bin/bash

docker-compose down -v

mvn clean

sudo rm -rf consul
sudo rm api-gateway/haproxy/haproxy.cfg
sudo rm -rf consul-template/data
