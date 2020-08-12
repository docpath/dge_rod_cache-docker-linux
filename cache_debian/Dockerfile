FROM mbe1224/debian-oracle-java:stretch-slim-jre8

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y lib32stdc++6 gcc-multilib procps
RUN mkdir /required_files
COPY cacheservicepack-6.x.y.z-java.jar /required_files/
WORKDIR /required_files
RUN java -jar cacheservicepack-6.x.y.z-java.jar -console -silentmode -install -solname"Cache Service" -solution"/usr/local/docpath/cacheservice"
RUN rm -rf /required_files
WORKDIR /usr/local/docpath/cacheservice/Bin
EXPOSE 1781

ENTRYPOINT ["java", "-jar", "dpcacheservice.war"]

