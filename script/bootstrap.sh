#!/usr/bin/env bash
# -*- coding: utf-8 -*-

export PROJECT_NAME=luismayta.github.io
# Vars Dir
export ROOT_DIR="`pwd`"
export RESOURCES_DIR="$ROOT_DIR/resources"
export SOURCE_DIR="$ROOT_DIR"
export STATIC_DIR="$SOURCE_DIR/static/"

export VIRTUALENV=$PROJECT_NAME
export VIRTUALENVS_PATH="$HOME_DIR/.virtualenvs"
export VIRTUALENV_PATH="$VIRTUALENVS_PATH/$VIRTUALENV"
export VIRTUALENV_FILE_ACTIVATE="$VIRTUALENV_PATH/bin/activate"
export VIRTUALENV_FILE_POSTACTIVATE="$VIRTUALENV_PATH/bin/postactivate"
