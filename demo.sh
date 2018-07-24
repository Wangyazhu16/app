#!/bin/bash

docker run -dp 8787:8787 -it --net idc -dp 8899:8899 -it --net idc test
