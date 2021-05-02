## Terragrunt
TERRAFORM_DIR:=$(PROVISION_DIR)/terraform
terragrunt := terragrunt

## show terragrunt help
.PHONY: terragrunt.help
terragrunt.help:
	@echo '    terragrunt:'
	@echo ''
	@echo '        terragrunt                 show help'
	@echo '        terragrunt.setup           install dependences'
	@echo '        terragrunt.environment     install dependences or change environment'
	@echo '        terragrunt                 command=(plan|apply|refresh|destroy|) by stage'
	@echo '        terragrunt.state           command=(list|mv|pull|push|rm|show|) by stage'
	@echo '        terragrunt.taint           args by stage'
	@echo '        terragrunt.taint.module    module by stage'
	@echo '        terragrunt.init            Init download dependences terraform'
	@echo '        terragrunt.import          command by stage'
	@echo '                                   example:'
	@echo '                         make terragrunt.import command="module.repository_learn_go.github_repository.this learn-go" stage=core'
	@echo '        terragrunt.destroy.module  module by stage'
	@echo '                                   example:'
	@echo '                         make terragrunt.destroy.module module="repository_eslint_config" stage=core'
	@echo ''

## make terragrunt validate
.PHONY: terragrunt.validate
terragrunt.validate:
	@if [ "${AWS_PROFILE_NAME}" != "${TEAM}" ]; then \
		echo "==> var ${AWS_PROFILE_NAME} not correspond ${TEAM}"; \
		exit 2; \
	fi

## make terragrunt
.PHONY: terragrunt
terragrunt: terragrunt.validate
	@if [ -z "${command}" ]; then \
		make terragrunt.help;\
	fi
	@if [ -z "${stage}" ] && [ -n "${command}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/ && $(terragrunt) ${command}-all --terragrunt-source-update; \
	elif [ -n "${stage}" ] && [ -n "${command}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/${stage} && $(terragrunt) ${command} --terragrunt-source-update; \
	fi

## install setup dependences terragrunt
.PHONY: terragrunt.setup
terragrunt.setup: terragrunt.validate
	@echo "==> setup terragrunt..."
	@tfenv install ${TERRAFORM_VERSION} && tfenv use ${TERRAFORM_VERSION}
	@echo ${MESSAGE_HAPPY}

## use version terraform
.PHONY: terragrunt.environment
terragrunt.environment:
	@echo "==> setup terragrunt..."
	@tfenv use ${TERRAFORM_VERSION} || tfenv install ${TERRAFORM_VERSION} && tfenv use ${TERRAFORM_VERSION}
	@echo ${MESSAGE_HAPPY}

## use version terraform
.PHONY: terragrunt.init
terragrunt.init: terragrunt.validate
	@if [ -z "${stage}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/ && $(terragrunt) init --reconfigure; \
	else \
		cd ${TERRAFORM_DIR}/us-east-1/${stage}/ && $(terragrunt) init --reconfigure; \
	fi

## state terragrunt command
.PHONY: terragrunt.state
terragrunt.state: terragrunt.validate
	@if [ -z "${command}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/prod && $(terragrunt) state ${command} --terragrunt-source-update; \
	fi
	@if [ -z "${stage}" ] && [ -n "${command}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/ && $(terragrunt) state ${command} --terragrunt-source-update; \
	elif [ -n "${stage}" ] && [ -n "${command}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/${stage} && $(terragrunt) state ${command} --terragrunt-source-update; \
	fi

## taint terragrunt command
.PHONY: terragrunt.taint
terragrunt.taint: terragrunt.validate
	@if [ -z "${args}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/prod && $(terragrunt) taint ${args}; \
	fi
	@if [ -z "${stage}" ] && [ -n "${args}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/ && $(terragrunt) taint ${args}; \
	elif [ -n "${stage}" ] && [ -n "${args}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/${stage} && $(terragrunt) taint ${args}; \
	fi

## taint module terragrunt command
.PHONY: terragrunt.taint.module
terragrunt.taint.module: terragrunt.validate
	@if [ -z "${module}" ]; then \
		echo "==> var module is required"; \
		exit 2; \
	fi
	@if [ -z "${stage}" ] && [ -n "${module}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/ && $(terragrunt) state list | grep module.${module} | xargs -n1 terraform taint; \
	elif [ -n "${stage}" ] && [ -n "${module}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/${stage} && $(terragrunt) state list | grep module.${module} | xargs -n1 terraform taint; \
	fi

## terragrunt destroy module
.PHONY: terragrunt.destroy.module
terragrunt.destroy.module: terragrunt.validate
	@if [ -z "${module}" ]; then \
		echo "==> var module is required"; \
		exit 2; \
	fi
	@if [ -z "${stage}" ] && [ -n "${module}" ]; then \
		echo "==> var module and stage is required"; \
		exit 2; \
	elif [ -n "${stage}" ] && [ -n "${module}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/${stage} && $(terragrunt) destroy -target=module.${module}; \
	fi

## terragrunt import
.PHONY: terragrunt.import
terragrunt.import: terragrunt.validate
	@if [ -z "${stage}" ]; then \
		cd ${TERRAFORM_DIR}/us-east-1/ && $(terragrunt) import ${command} ; \
	else \
		cd ${TERRAFORM_DIR}/us-east-1/${stage}/ && $(terragrunt) import ${command} ; \
	fi
