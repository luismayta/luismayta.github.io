#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

# Create database.
arr=$(echo $DB_URL | tr "/" "\n")
for x in $arr
do
    DB_NAME="$x"
done
dropdb $DB_NAME
createdb $DB_NAME
make clean
make clean_migrations
cd $SOURCE_DIR/
python manage.py makemigrations
python manage.py migrate_schemas

# Create super.
EMAIL="hola@dgnest.com"
FIRST_NAME="Hola"
LAST_NAME="Mundo"
PASSWORD="123456abcd"
python manage.py createsuper --email=$EMAIL --first_name=O --last_name=G --password=123456abcd

echo -e "\nEmail:\t\t\t" $EMAIL
echo -e "First name:\t\t" $FIRST_NAME
echo -e "Last name:\t\t" $LAST_NAME
echo -e "Password:\t\t" $PASSWORD "\n"

# Setting up.
UBLUE='\033[4;34m'
BIBLUE='\033[1;94m'
echo -e "\n"
echo -e $BIBLUE$UBLUE"#### Setting up the public schema ####"
echo -e "\n"
python manage.py setup
