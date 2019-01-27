#
# See ./CONTRIBUTING.rst
#

SERVICE:=app
PATH_DOCKER_COMPOSE:=provision/docker-compose
DOCKER_TEST := docker-compose -f docker-compose.yml -f "${PATH_DOCKER_COMPOSE}"/dev.yml

hugo.help:
	@echo '    Hugo:'
	@echo ''
	@echo '        hugo                    Run all help hugo'
	@echo '        hugo.server             Run all pre-commit'
	@echo ''

hugo: clean
	make hugo.help

hugo.server: clean
	@if [ "${stage}" == "" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml run --rm \
			--service-ports "$(SERVICE)" bash -c "hugo server --bind=0.0.0.0" ; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${stage}".yml run --rm \
			--service-ports "$(SERVICE)" bash -c "hugo server --bind=0.0.0.0"; \
	fi
