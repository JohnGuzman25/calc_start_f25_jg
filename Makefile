# Mac-friendly Makefile: uses python3 and points tests at src/
PY := python3
PIP := $(PY) -m pip

.PHONY: install lint test coverage ci-check

install:
	$(PY) -m pip install --upgrade pip
	$(PIP) install -r requirements.txt

# keep non-blocking while you iterate
lint:
	PYTHONPATH=src pylint src tests || true

test:
	PYTHONPATH=src pytest -v

coverage:
	PYTHONPATH=src pytest --cov=src/calculator --cov-report=xml --cov-report=term-missing

# Run everything like CI
ci-check: install lint coverage
