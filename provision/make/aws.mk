#
# See ./docs/contributing.md
#
AWS_SERVICE:=app
AWS=$(PIPENV_RUN) aws

aws.help:
	@echo '    Aws:'
	@echo ''
	@echo '        aws                    Run all help aws'
	@echo '        aws.deploy             stage=(dev|prod) deploy files to bucket'
	@echo ''

aws:
	make aws.help

aws.deploy:
	@if [ -z "${stage}" ] || [ "${stage}" == "dev" ]; then \
		$(AWS) s3 sync ${AWS_PATH_DEPLOY} ${AWS_BUCKET_DEV_NAME} --delete; \
	elif [ "${stage}" == "prod" ]; then \
		$(AWS) s3 sync ${AWS_PATH_DEPLOY} ${AWS_BUCKET_PROD_NAME} --delete; \
	fi
