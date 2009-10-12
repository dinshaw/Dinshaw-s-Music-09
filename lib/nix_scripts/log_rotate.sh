#!/bin/sh
mkdir archive -p
tar czf "archive/`date +%Y%m%d`_production.tar.gz" production.log
cat /dev/null > production.log
find archive/* -mtime +180 -exec rm {} \;