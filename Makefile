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
	rm -rf ./data/*

