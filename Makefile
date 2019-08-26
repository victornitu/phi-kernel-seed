DOMAIN ?= domain.phikernel.com
TARGET ?= proxy-api
EMAIL ?= info@vvfluxembourg.com

start:
	docker-compose up -d
restart: 
	docker-compose up -d --build
pause: 
	docker-compose pause
unpause: 
	docker-compose unpause
stop: 
	docker-compose down
list: 
	docker-compose ps
logs: 
	docker-compose logs -f $TARGET
clean:
	rm -rf ./data/*
cert:
    docker run -it -v ./config:/etc/letsencrypt/live/$DOMAIN certbot/certbot certonly --standalone -n -m $MAIL --agree-tos --force-renewal -d $DOMAIN
