#!/bin/bash

echo 'Refer to the command line docs on how to use the keepass cmdline
https://keepass.info/help/base/cmdline.html
'

echo 'Before starting make sure to run: "xhost + 127.0.0.1" in the XQuartz terminal
'

echo 'Base command should be like:'
echo '
docker run \
--rm \
-e DISPLAY=host.docker.internal:0 \
$(<TAG)
'

echo 'But then you need to send the keepass database file, like:'
echo '
docker run \
--rm \
-v /path/to/keepass/database:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
/keepass_db/keepass.kdbx
'

echo 'Also you could send the plain password along, like:'
echo '
docker run \
--rm \
-v /path/to/keepass/database:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
/keepass_db/keepass.kdbx -pw=""
'

echo 'Or better yet send the encrypted password by following this doc:
https://keepass.info/help/base/placeholders.html#passwordenc
I have not tried it yet, but I am guessing it should be something like:'
echo '
docker run \
--rm \
-v /path/to/keepass/database:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
/keepass_db/keepass.kdbx -pw-enc=""
'

echo 'Or a more scripted way is to do it like that:'
echo '
osascript -e 'tell app "Terminal" to do script "xhost + 127.0.0.01 && kill -9 $(ps -p $PPID -o ppid=)"' 

COMMAND="/keepass_db/db.kdbx"

if [ ! -z "$KEEPASS_PW" ] ; then
  COMMAND="$COMMAND -pw="$KEEPASS_PW""
fi

echo $COMMAND

docker run \
--rm \
-it \
-v $PWD:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
$COMMAND
'

echo 'Also to test the container in commandline, in case you were getting some random errors:'
echo '
docker run \
--rm \
-e DISPLAY=host.docker.internal:0 \
--entrypoint /bin/bash \
$(<TAG) \
-c "tail -f /proc/loadavg"
'
