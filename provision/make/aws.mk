#
# See ./CONTRIBUTING.rst
#
AWS_SERVICE:=app
AWS=$(PIPENV_RUN) aws

aws.help:
	@echo '    Aws:'
	@echo ''
	@echo '        aws                    Run all help aws'
	@echo '        aws.deploy             deploy files to bucket'
	@echo ''

aws: clean
	make aws.help

aws.deploy: clean
	$(AWS) s3 sync ${AWS_PATH_DEPLOY} ${AWS_BUCKET_NAME} --delete
