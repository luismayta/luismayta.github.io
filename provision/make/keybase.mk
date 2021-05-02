#
# See ./docs/contributing.md
#
.PHONY: keybase.help

keybase.help:
	@echo '    keybase:'
	@echo ''
	@echo '        keybase                      help keybase'
	@echo '        keybase.env                  Environment path for keybase'
	@echo '        keybase.setup                Setup dependences for keybase'
	@echo ''

keybase:
	make keybase.help

keybase.env:
	@echo "==> make environment for ${TEAM}..."
	mkdir -p ${KEYBASE_PROJECT_PATH}/gpg
	mkdir -p ${KEYBASE_PROJECT_PATH}/{staging,prod,dev,core}/{pem,private,password,pub,openssl}
	@echo ${MESSAGE_HAPPY}

keybase.setup:
	@echo "==> make dependences for ${TEAM}..."
	mkdir -p ${KEYBASE_PROJECT_PATH}/gpg
	mkdir -p ${KEYBASE_PROJECT_PATH}/{staging,prod,dev,core}/{pem,private,password,pub,openssl}
	@echo ${MESSAGE_HAPPY}
