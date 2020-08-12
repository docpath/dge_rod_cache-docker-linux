FROM mbe1224/debian-oracle-java:stretch-slim-jre8

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y lib32stdc++6 gcc-multilib procps
RUN mkdir /required_files
COPY docgenerationpackv6-6.x.y.z-java.jar /required_files/
WORKDIR /required_files
RUN java -jar docgenerationpackv6-6.x.y.z-java.jar -solname"DocPath DocGeneration Engine Pack v6" -install -solution"/usr/local/docpath/generation" -silentmode -console -licserverpath"/usr/local/docpath/licenseserver" -licserverport1765
COPY DocPathDocGenerationEnginePack.lic /usr/local/docpath/Licenses/
COPY sinclairconfig.ini /usr/local/docpath/generation/configuration/
COPY run.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/run.sh
COPY Data /usr/local/docpath/generation/resources/data/
WORKDIR /
RUN rm -rf /required_files 
EXPOSE 8084

ENTRYPOINT ["/usr/local/bin/run.sh"]
