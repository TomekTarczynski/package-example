# Define variables
VENV_DIR = .venv
PYTHON = $(VENV_DIR)/Scripts/python
PIP = $(VENV_DIR)/Scripts/pip
REQUIREMENTS = requirements.txt
PACKAGE = mypackage
SCRIPT = main.py

# Default target
all: run

# Create virtual environment
$(VENV_DIR)/Scripts/activate:
	@echo "Creating virtual environment..."
	@python -m venv $(VENV_DIR)

# Install dependencies and package in editable mode
install: $(VENV_DIR)/Scripts/activate
	@echo "Installing dependencies and the package"
	@$(PIP) install packages/.

# Run the tests using pytest
test: install
	@echo "Running tests..."
	@$(VENV_DIR)/Scripts/pytest

# Run the main program
run: install
	@echo "Running the main program..."
	@$(PYTHON) $(SCRIPT)

# Clean up the virtual environment and cache files
clean:
	@echo "Cleaning up..."
	@if exist $(VENV_DIR) ( rmdir /S /Q $(VENV_DIR) )
	@if exist "packages/mypackage/__pycache__" ( rmdir /S /Q "packages/mypackage/__pycache__" )
	@if exist "packages/mypackage.egg-info" ( rmdir /S /Q "packages/mypackage.egg-info" )
	@if exist "packages/build" ( rmdir /S /Q "packages/build" )

.PHONY: all install test run clean