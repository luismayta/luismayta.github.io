#
# See ./docs/contributing.md
#

## show keys.help
.PHONY: keys.help
keys.help:
	@echo '    keys:'
	@echo ''
	@echo '        keys                      help keys'
	@echo '        keys.make                 make key openssl by stage'
	@echo ''

## show help keys commands
.PHONY: keys
keys:
	make keys.help

## show keys make
.PHONY: keys.make
keys.make:
	mkdir -p ${KEYBASE_PATH}/${stage}/openssl/
	openssl genrsa -out ${PROJECT}-${stage}.pem 2048
	openssl rsa -in ${PROJECT}-${stage}.pem -pubout -out ${PROJECT}-${stage}.public.pem
	mv ${PROJECT}-${stage}.pem ${KEYBASE_PATH}/${stage}/openssl/${PROJECT}-${stage}.pem
	mv ${PROJECT}-${stage}.public.pem ${KEYBASE_PATH}/${stage}/openssl/${PROJECT}-${stage}.pem