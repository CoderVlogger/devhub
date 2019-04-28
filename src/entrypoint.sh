#!/bin/bash
python3 manage.py makemigrations --settings=devhub.settings.docker
python3 manage.py migrate --settings=devhub.settings.docker
python3 manage.py migrate devhub --settings=devhub.settings.docker
python3 manage.py migrate account --settings=devhub.settings.docker
#python3 manage.py createsu admin --settings=devhub.settings.docker
exec "$@"
