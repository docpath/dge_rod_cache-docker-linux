#!/bin/bash

set -e

cache_url="http://$DP_CACHE_ADDR:$DP_CACHE_PORT"

cd /usr/local/docpath/licenseserver/licenseserver/Bin
./startServer.sh

cd /usr/local/docpath/resourcesondemand/Bin
exec java -jar dprodservice.war "-imagespath/usr/local/docpath/resourcesondemand/images/" "-licenseaddrlocalhost" "-licenseport1765" "-csurl$cache_url" -logmodeconsole -formspath/usr/local/docpath/resourcesondemand/forms -cleanmaskfilenametrue

