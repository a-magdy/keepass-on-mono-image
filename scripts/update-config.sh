#!/bin/bash

# Disable auto update from this doc: https://keepass.info/help/v2_dev/customize.html
sed -i -e 's/<UIFlags>0<\/UIFlags>/<UIFlags>33<\/UIFlags>/g' /KeePass/KeePass.config.xml
