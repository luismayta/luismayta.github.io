# App
.PHONY: app

app.help:
	@echo '    App:'
	@echo ''
	@echo '        app                  show help'
	@echo '        app        	        command=(server)'
	@echo '        app.run     	        running server with stage={{stage}}'
	@echo ''

app:
	@if [ -z "${command}" ]; then \
		make app.help;\
	fi
	@if [ -z "${stage}" ] && [ -n "${command}" ]; then \
		$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml run \
			--rm --service-ports app; \
	elif [ -n "${stage}" ] && [ -n "${command}" ]; then \
		$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/${stage}.yml run \
			--rm --service-ports app; \
	fi

app.run:
	if [ -z "${stage}" ]; then \
		$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml run \
			--rm --service-ports app; \
	else \
		$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/${stage}.yml run \
			--rm --service-ports app; \
	fi
