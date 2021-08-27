#!/usr/bin/env bash

set -ex

printenv | sort

pipenv run ./manage.py migrate
# first time superuser creation from env vars
pipenv run ./manage.py createsuperuser --no-input || true
pipenv run ./manage.py runserver 0:80
