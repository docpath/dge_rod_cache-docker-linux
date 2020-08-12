# Docker Configuration Files for DGE with Repositorized Forms

This is a complete example about how to deploy a complete environment with DocPath ® DocGeneration Engine 6 and DocPath ® Resources on Demand 6 on Linux using Docker. The example contains the following files:

- mount_dge.sh: Script file to build and deploy the containers.
- /cache_debian: Files to build and deploy DocPath ® Cache Service 6.
- /rod_debian: Files to build and deploy DocPath ® Resources on Demand 6.
- /dge_debian: Files to build and deploy DocPath ® DocGeneration Engine 6.

The example must be completed with the following files in the same directory as the repositorized files:

- /cache_debian
  - cacheservicepack-6.x.y.z-java.jar: DocPath ® Cache Service 6 Installer.
- /rod_debian
  - resourcesondemandpack-6.x.y.z-java.jar: DocPath ® Resources on Demand 6 Installer.
  - licenseservicepack-6.x.y.z-java.jar: DocPath ® License Server Installer.
  - DocPath License File.lic: License file.
- /dge_debian
  - docgenerationpackv6-6.X.Y-java.jar: DocPath ® DocGeneration Engine 6 Installer.
  - DocPath License File.lic: License file.

## Necessary changes
- /cache_debian
  - Change the cacheservicepack-6.x.y.z-java.jar with the corresponding DocPath ® Cache Service 6 version in Dockerfile.
- /rod_debian
  - Change the resourcesondemandpack-6.x.y.z-java.jar with the corresponding DocPath ® Resources on Demand 6 installer version in Dockerfile.
  - Change the licenseservicepack-6.x.y.z-java.jar with the corresponding DocPath ® License Server installer version in Dockerfile.
  - Change the DocPath_License_File.lic file with the corresponding license filename.
- /dge_debian
  - Change the docgenerationpackv6-6.X.Y.-java.jar with the corresponding DocPath ® DocGeneration Engine 6 version in Dockerfile.
  - Change the DocPath_License_File.lic file with the corresponding license filename.

## How to build and deploy
This repository contains a script file called "mount_dge.sh", it contains all the steps that are needed to build and deploy all the products. 
Assign execution permissions using:

`chmod +x mount_dge.sh `

Now execute it:

`./mount_dge.sh `

## Test
Open this URL with any browser:

` http://localhost:8084/dge/Execute?sync=true&project=BANKSTATEMENT&data=/usr/local/docpath/generation/resources/data/bankstatement.dat&getdocs=true&other=-gpdf&other=-qfsversion `

In case a PDF is returned, then the environment has successfully been deployed.
