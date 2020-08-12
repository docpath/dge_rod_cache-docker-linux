#!/bin/bash

dge_file='/usr/local/docpath/generation/configuration/dge.ini'
rod_port="${DP_ROD_PORT-1782}"
rod_address="${DP_ROD_ADDR-localhost}"
cache_port="${DP_CACHE_PORT-1781}"
cache_address="${DP_CACHE_ADDR-localhost}"

echo '[main]' > "$dge_file"
echo 'desiredcachesize = 100' >> "$dge_file"
echo '' >> "$dge_file"
echo '[resources-on-demand]' >> "$dge_file"
echo "http port = $rod_port" >> "$dge_file"
echo 'http context = DpRoD' >> "$dge_file"
echo "server address = http://$rod_address" >> "$dge_file"
echo "cache service = http://$cache_address:$cache_port" >> "$dge_file"
echo 'http timeout = 5' >> "$dge_file"
echo 'cache retry delay = 2500' >> "$dge_file"
echo '' >> "$dge_file"

cd /usr/local/docpath/licenseserver/licenseserver/Bin
./startServer.sh

cd /usr/local/docpath/generation
exec java -jar dge.war -logmodeconsole

