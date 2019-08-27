DOMAIN ?= example.com
EMAIL ?= contact@example.com
TARGET ?= proxy-api

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
	docker-compose logs -f ${TARGET}
clean:
	rm -rf ./data/* ./conf/*
cert:
	mkdir -p conf/certbot-etc conf/certbot-var conf/dhparam
	openssl dhparam -out ./conf/dhparam/dhparam-2048.pem 2048
	docker run -it \
	-v ./conf/certbot-etc:/etc/letsencrypt  \
	-v ./conf/certbot-var:/var/lib/letsencrypt  \
	certbot/certbot certonly --standalone -n -m ${MAIL} --agree-tos --no-eff-email --force-renewal -d ${DOMAIN}
