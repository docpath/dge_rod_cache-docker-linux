FROM openjdk:8

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y lib32stdc++6 gcc-multilib procps
RUN mkdir /required_files
COPY resourcesondemandpack-6.x.y.z-java.jar licenseservicepack-6.x.y.z-java.jar /required_files/
WORKDIR /required_files
RUN java -jar licenseservicepack-6.x.y.z-java.jar -solname"DocPath License Server" -install -console -silentmode -licserverpath"/usr/local/docpath/licenseserver" -licserverport1765 && \
    java -jar resourcesondemandpack-6.x.y.z-java.jar -console -silentmode -install -solname"Resources on Demand Service" -solution"/usr/local/docpath/resourcesondemand"
COPY DocPathResourcesonDemandPack.olc /usr/local/docpath/Licenses/
COPY run.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/run.sh
WORKDIR /
RUN rm -rf /required_files
COPY Forms /usr/local/docpath/resourcesondemand/forms/
COPY Images /usr/local/docpath/resourcesondemand/images/
COPY licenseserver.ini /usr/local/docpath/licenseserver/licenseserver/Configuration/
EXPOSE 1782

ENTRYPOINT ["/usr/local/bin/run.sh"]

