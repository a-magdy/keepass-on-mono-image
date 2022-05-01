#!/bin/bash

# This script runs KeePass in a Mono container, check the docker image repo here for prerequisites (XQuartz):
#  https://github.com/a-magdy/keepass-on-mono-image

# TODO check that XQuartz is installed, configured properly and lastly up and running

osascript -e 'tell app "Terminal" to do script "xhost + 127.0.0.1 && kill -9 $(ps -p $PPID -o ppid=)"'

# TODO Maybe find the first file that ends with .kdbx and use it by default
COMMAND="/keepass_db/keepass.kdbx"

if [ ! -z "$KEEPASS_PW" ] ; then
  COMMAND="$COMMAND -pw="$KEEPASS_PW""
fi

echo $COMMAND

docker run \
--rm \
-it \
-v $PWD:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
amagdy/keepass:2.42.1 \
$COMMAND
