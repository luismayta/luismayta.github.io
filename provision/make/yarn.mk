#
# See ./CONTRIBUTING.rst
#

SERVICE_YARN=nodejs
yarn.help:
	@echo '    yarn:'
	@echo ''
	@echo '        yarn                       command=(build|dev|start)'
	@echo '        yarn.install               Install dependences'
	@echo '        yarn.dev                   dev project'
	@echo '        yarn.start                 run project'
	@echo '        yarn.public                build public'
	@echo ''

yarn.install: clean
	$(docker-yarn-run) yarn install

yarn.start: clean
	$(docker-yarn-run) yarn start

yarn.public: clean
	$(docker-yarn-run) yarn public

yarn.dev: clean
	$(docker-yarn-run) yarn run dev

yarn: clean
	@if [ -z "${command}" ]; then \
		make yarn.help;\
	fi
	@if [ -n "${command}" ]; then \
		mkdir -p public;\
		$(docker-yarn-run) yarn  ${command};\
	fi
