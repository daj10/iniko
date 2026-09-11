PYTHON ?= python
UV := uv
UV_RUN := $(UV) run
MANAGE := $(UV_RUN) $(PYTHON) manage.py

.PHONY: help install runserver makemigrations migrate migrations-check \
        shell test makemessages compilemessages \
        lint-check lint-fix format-check format-fix type-check \
        check fix validate


help: ## Display available commands.
	@echo "Available commands:"
	@echo "  make install            Install project dependencies"
	@echo "  make runserver          Run the development server"
	@echo "  make makemigrations     Create database migrations"
	@echo "  make migrate            Apply database migrations"
	@echo "  make migrations-check   Check for missing migrations"
	@echo "  make shell              Open the enhanced Django shell"
	@echo "  make test               Run the test suite"
	@echo "  make makemessages       Extract translation strings"
	@echo "  make compilemessages    Compile translation files"
	@echo "  make lint-check         Check linting issues"
	@echo "  make lint-fix           Fix linting issues"
	@echo "  make format-check       Check code formatting"
	@echo "  make format-fix         Format code"
	@echo "  make type-check         Check types with MyPy"
	@echo "  make check              Run Django system checks"
	@echo "  make fix                Fix linting and formatting issues"
	@echo "  make validate           Run all validation checks"


install: ## Install project dependencies.
	$(UV) sync

runserver: ## Run the development server.
	$(MANAGE) runserver

makemigrations: ## Create database migrations.
	$(MANAGE) makemigrations

migrate: ## Apply database migrations.
	$(MANAGE) migrate

migrations-check: ## Check for missing migrations.
	$(MANAGE) makemigrations --check --dry-run

shell: ## Open the enhanced Django shell.
	$(MANAGE) shell_plus

test: ## Run the test suite.
	DJANGO_SETTINGS_MODULE=config.settings.test $(MANAGE) test

makemessages: ## Extract translatable strings into locale files.
	$(MANAGE) makemessages -l fr

compilemessages: ## Compile translation files.
	$(MANAGE) compilemessages

lint-check: ## Check linting issues without modifying files.
	$(UV_RUN) ruff check .

lint-fix: ## Fix linting issues automatically.
	$(UV_RUN) ruff check . --fix

format-check: ## Check formatting without modifying files.
	$(UV_RUN) ruff format --check .

format-fix: ## Format files.
	$(UV_RUN) ruff format .

type-check: ## Check types with MyPy.
	$(UV_RUN) mypy

check: ## Run Django system checks.
	$(MANAGE) check

fix: lint-fix format-fix ## Fix linting and formatting issues.

validate: format-check lint-check type-check check migrations-check test