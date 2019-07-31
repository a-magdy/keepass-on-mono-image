#!/bin/bash

# Refer to the command line docs on how to use the keepass cmdline
# https://keepass.info/help/base/cmdline.html

# Base command should be like: 
echo "
docker run \
--rm \
-e DISPLAY=host.docker.internal:0 \
$(<TAG)
"

# But then you need to send the keepass database file, like:
echo "
docker run \
--rm \
-v /path/to/keepass/database:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
/keepass_db/keepass.kdbx
"

# Also you could send the plain password along, like:
echo "
docker run \
--rm \
-v /path/to/keepass/database:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
/keepass_db/keepass.kdbx -pw=""
"

# Or better yet send the encrypted password by following this doc:
# https://keepass.info/help/base/placeholders.html#passwordenc
# I haven't tried it yet, but I am guessing it should be something like:
echo "
docker run \
--rm \
-v /path/to/keepass/database:/keepass_db \
-e DISPLAY=host.docker.internal:0 \
$(<TAG) \
/keepass_db/keepass.kdbx -pw-enc=""
"

# Also to test the container in commandline, in case you were getting some random errors:
echo "
docker run \
--rm \
-e DISPLAY=host.docker.internal:0 \
--entrypoint /bin/bash \
$(<TAG) \
-c "tail -f /proc/loadavg"
"
