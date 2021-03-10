# vi curl-url-check.sh

#!/bin/bash
if curl -I "http://localhost:5000" 2>&1 | grep -w "200\|301" ; then
    echo "Webserver is up"
else
    echo "Webserver is down"
fi