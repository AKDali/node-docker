# Run a container with options 
docker run -p 3001:5000 -d \
-v /home/kadviz/Developer/JS/docker-course:/app:ro \
-v /app/node_modules --env-file ./.env \
--name my-container \
my-app:latest

# Delete container named "my-app" with options -f (force delete if container running) -v (delete persistent volume)
docker rm my-app -fv
