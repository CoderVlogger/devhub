ROOT_DIR:=./
SRC_DIR:=./src
VENV_BIN_DIR:="venv/bin"

VIRTUALENV:=$(shell which virtualenv)

REQUIREMENTS_DIR:="requirements"
REQUIREMENTS_LOCAL:="$(REQUIREMENTS_DIR)/local.txt"
REQUIREMENTS_DOCKER:="$(REQUIREMENTS_DIR)/docker.txt"

PIP:="$(VENV_BIN_DIR)/pip"
FLAKE8:="$(VENV_BIN_DIR)/flake8"
ISORT:="$(VENV_BIN_DIR)/isort"
AUTOPEP8:="$(VENV_BIN_DIR)/autopep8"

CMD_FROM_VENV:=". $(VENV_BIN_DIR)/activate; which"
PYTHON=$(shell "$(CMD_FROM_VENV)" "python")

# .PHONY: hello venv freeze check fix clean makemigrations migrate superuser runlocal rundocker runcelery

hello:
	@echo "Hello, World!"

# DEVELOPMENT

define create-venv
virtualenv venv -p python3
endef

venv:
	@$(create-venv)
	@$(PIP) install -r $(REQUIREMENTS_LOCAL)

freeze: venv
	@$(PIP) freeze > $(REQUIREMENTS_LOCAL)

check: venv
	@$(FLAKE8) src
	@$(ISORT) -rc -c src

fix: venv
	@$(ISORT) -rc src
	@$(AUTOPEP8) --in-place --aggressive --recursive src

clean:
	@rm -rf .cache
	@rm -rf htmlcov coverage.xml .coverage
	@find . -name *.pyc -delete
	@find . -name db.sqlite3 -delete
	@find . -type d -name __pycache__ -delete
	@rm -rf venv
	@rm -rf .tox

# TOOLS/SCRIPTS

migrations: venv
	@$(PYTHON) $(SRC_DIR)/manage.py makemigrations $(app) --settings devhub.settings.local

migrate: venv
	@$(PYTHON) $(SRC_DIR)/manage.py migrate $(app) $(migration) --settings devhub.settings.local

superuser: venv
	@$(PYTHON) $(SRC_DIR)/manage.py createsuperuser --settings devhub.settings.local

# LOCAL

runlocal: venv
	@$(PYTHON) $(SRC_DIR)/manage.py runserver --settings devhub.settings.local

# DOCKER

rundocker:
	@docker-compose up --build
