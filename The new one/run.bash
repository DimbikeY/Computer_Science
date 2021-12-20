#!/usr/bin/env bash
xhost +local:docker || true
docker run  -ti --rm \
            --net=host \
            --privileged \
            --name my_images my_images \
            bash
