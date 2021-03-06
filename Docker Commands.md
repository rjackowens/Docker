# Compose
docker-compose -p image_name up --force-recreate

# Build Image
docker build -t image_name .

# Run Container from Image
docker run image_name

# Start Existing Container
docker start image_name

# Test Installation
docker run hello-world

# Test Connectivity (Integrated Terminal)
docker exec -it container_name ping 8.8.8.8

# Pull Image
docker pull image_name:TAG

# Search Images by Rating
docker search --filter stars=50 image_name

# View All Containers
docker container ls -a

# View All Images
docker image ls -a

# View All Volumes
docker volume ls -a

# Create Volume
docker volume create

# Docker System Info
docker system info

# Delete Container 
docker rm container_name

# Delete Image
docker image rm image_name

# Delete Everything 
docker system prune -a

# Remove NetNat
Get-NetNat | Remove-NetNat

# Create Network
docker network create network_name --driver <nat>

# Select Specific Network
docker run image_name --network=nat

# List All Networks
docker network ls 

# Inspect Network
docker network inspect network_name

# Switch Container Base OS
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchDaemon

# Login to Registry
docker login

# Logout of Registry
docker logout

# Clean up Containers
docker container prune

# Clean up Images
docker image prune

# View Output of Detached Containers
docker logs container_name -f

# Attach to Running Container
docker attach container_name 

# Poll Docker Registry Repositories
curl http://localhost:5000/v2/_catalog {"repositories":[]}
