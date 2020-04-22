#!/bin/bash

set -e

docker build -t fedormalyshkin/spark-base:2.4.5 ./docker/base
docker build -t fedormalyshkin/spark-master:2.4.5 ./docker/spark-master
docker build -t fedormalyshkin/spark-worker:2.4.5 ./docker/spark-worker
docker build -t fedormalyshkin/spark-submit:2.4.5 ./docker/spark-submit
