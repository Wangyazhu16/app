#!/bin/bash

docker run --rm -it --name some-mongo --net idc -dp 27017:27017 \
    -e MONGO_INITDB_ROOT_USERNAME=mongo \
    -e MONGO_INITDB_ROOT_PASSWORD=mongo \
    -e MONGO_INITDB_DATABASE=admin mongo
