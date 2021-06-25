# on Dev ENV
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
git add --all
git commit -m "text"
git push
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build node-app
docker login
docker-compose -f docker-compose.yml -f docker-compose.prod.yml push node-app

# on Prod ENV
## install docker 
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker --version

## install docker (amazon linux 2) go and check below repo
https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9

## install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v

## clone repository
git clone https://github.com/AKDali/node-docker .

## install swarm
docker info
docker swarm init

## deploy stack (services & tasks)
docker stack deploy -c docker-compose.yml -c docker-compose.prod.yml myapp

## navigate wihtin stack
docker stack ls
docker stack services myapp
docker stack ps myapp

## remove stack
docker stack rm myapp
