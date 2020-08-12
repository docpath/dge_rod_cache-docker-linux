#!/bin/bash
echo "*** Building DocPath Cache Service ***"
cd cache_debian
docker build -t docpath/cache .
echo "** Running DocPath Cache Service"
docker run --name cache --hostname <MachineHostname> --detach -p 1781:1781 docpath/cache
cache_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cache)

echo "*** Building DocPath Resources on Demand ***"
cd ..
cd rod_debian
docker build -t docpath/rod .
echo "** Running DocPath Resources On Demand"
docker run --name rod --hostname <MachineHostname>  --detach -p 1782:1782 -e DP_CACHE_ADDR=$cache_ip -e DP_CACHE_PORT=1781 docpath/rod
rod_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' rod)

echo "*** Building DocPath DocGeneration Engine  ***"
cd ..
cd dge_debian
docker build -t docpath/dge .
echo "*** Running DocPath DocGeneration Engine ***"
docker run --name dge --hostname <MachineHostname>  --detach -p 8084:8084 -e DP_CACHE_ADDR=$cache_ip -e DP_CACHE_PORT=1781 -e DP_ROD_ADDR=$rod_ip -e DP_ROD_PORT=1782 docpath/dge
