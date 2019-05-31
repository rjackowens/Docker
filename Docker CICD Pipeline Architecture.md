There are 3 relevant Docker files necessary for every project:

**docker-compose.yml:** Contains instructions for deploying the container

**docker.env:** Contains secrets such as Azure Key Vault variables 

**Dockerfile:** Contains instructions for building a container


When a commit is made, the project builds in the pipeline normally. During this step, the 3 Docker files above are copied into the build artifact. 

## **BUILD PIPELINE**
1.	Project builds normally (via MSBuild, NPM, etc.)
2.	The 3 Docker files are copied into the build artifact

After building, the artifact is extracted in the release pipeline. The placeholder text in the Dockerfile is replaced by the values in the corresponding Azure pipeline variables. Any existing running container on the deployment servers are stopped and removed. Finally, docker-compose invokes the **docker-compose.yml** and deploys new detached containers on the target deployment servers.

## **RELEASE PIPELINE**
1.	Artifact is extracted
2.	Placeholder text in **Dockerfile** is replaced
3.	Any existing running container is stopped and removed
4.	Docker-compose invokes the **docker-compose.yml** 
5.	A new container runs detached on the target deployment servers

## **VIEWING CONTAINER OUTPUT**

After a container has been deployed, it runs in the background (“detached” mode) on the deployment servers. To view output or interact with the container, use the following commands:

**docker logs _container_name_ –f**  –> This command allows you to view all standard output of the container in real time

**docker attach _container_name_** –> This command brings the detached container to the foreground, allowing you to view output and control it interactively
