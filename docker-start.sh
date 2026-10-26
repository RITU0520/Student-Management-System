#!/bin/sh
set -eu

# Hosting platforms commonly provide the listening port in PORT.
PORT="${PORT:-8080}"
sed -i "s/port=\"8080\"/port=\"${PORT}\"/" /usr/local/tomcat/conf/server.xml

exec catalina.sh run
