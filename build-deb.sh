#/bin/bash

# build docker image
docker build $1 -t kokardy/mozc .

# run container
docker run -d --name mozc kokardy/mozc tail -f /dev/null

# copy *.deb
docker cp mozc:/home/mozc_builder/work/deb ./

# stop
docker stop mozc
