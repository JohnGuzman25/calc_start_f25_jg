.PHONY: install lint test coverage ci-check

install:
	python -m pip install --upgrade pip
	pip install -r requirements.txt

# Keep lint non-blocking so CI stays green while you iterate
lint:
	pylint src tests || true

test:
	PYTHONPATH=src pytest -v

coverage:
	PYTHONPATH=src pytest --cov=src/calculator --cov-report=xml --cov-report=term-missing

# Simulate CI locally
ci-check: install lint coverage
