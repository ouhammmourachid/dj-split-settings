
# variables
POETRY_RUN		:= poetry run
PRE_COMMIT_CMD		:= $(POETRY_RUN) pre-commit

install:
	poetry install

update:
	poetry update

build:
	poetry build

publish:
	poetry publish

test:
	$(POETRY_RUN) pytest

install/pre-commit:
	$(PRE_COMMIT_CMD) uninstall && $(PRE_COMMIT_CMD) install

lint:
	$(PRE_COMMIT_CMD) run --all-files

coverage:
	$(POETRY_RUN) pytest --cov ./mermaid --cov-report=xml

bumpversion:
	$(eval name=$(filter-out $@,$(MAKECMDGOALS)))
	$(POETRY_RUN) bumpver update --$(name)
%:
	@:

help:
	@echo "run 'make <target>' where <target> is one of the following:"
	@echo ""
	@echo "  install           		install dependencies"
	@echo "  update            		update dependencies"
	@echo "  build             		build package"
	@echo "  publish           		publish package"
	@echo ""
	@echo "  test              		run tests"
	@echo "  install/pre-commit 		install pre-commit hooks"
	@echo "  lint              		run linters"
	@echo "  coverage          		run tests with coverage"
	@echo ""
	@echo "  bumpversion       		bump version"
	@echo "  help              		show this help message"
	@echo ""