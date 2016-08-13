# Makefile for luismayta-github.io.
# See INSTALL for details.

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
BIN_DIR = $(ROOT_DIR)/bin
DATA_DIR = $(ROOT_DIR)/var
SCRIPT_DIR = $(ROOT_DIR)/script

WGET = wget

# Bin scripts
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
SETUP = $(shell) $(SCRIPT_DIR)/setup.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh
RUNSERVER = $(shell) $(SCRIPT_DIR)/runserver.sh
TRANSLATE = $(shell) $(SCRIPT_DIR)/translate.sh
SYNC = $(shell) $(SCRIPT_DIR)/sync.sh

install:
	$(SETUP)

create_database:
	$(CREATE_DATABASE)


clean:
	$(CLEAN)


clean_migrations: clean
	$(CLEAN_MIGRATIONS)


deploy:
	$(ANSIBLE_PROVISION)
	$(ANSIBLE_DEPLOY)


distclean: clean
	rm -rf $(ROOT_DIR)/lib
	rm -rf $(ROOT_DIR)/*.egg-info
	rm -rf $(ROOT_DIR)/demo/*.egg-info


maintainer-clean: distclean
	rm -rf $(BIN_DIR)
	rm -rf $(ROOT_DIR)/lib/


runserver:
	$(RUNSERVER)


sync:
	$(SYNC)
