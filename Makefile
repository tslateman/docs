# Makefile for MkDocs Documentation
# Run 'make help' to see available commands

.PHONY: help setup install serve build clean deploy test check-deps

# Default Python version
PYTHON := python3
VENV := venv
VENV_BIN := $(VENV)/bin

# MkDocs settings
MKDOCS := $(VENV_BIN)/mkdocs
PIP := $(VENV_BIN)/pip
PORT := 8000

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
RESET := \033[0m

## help: Show this help message
help:
	@echo "$(CYAN)MkDocs Documentation Makefile$(RESET)"
	@echo "$(GREEN)Available commands:$(RESET)"
	@echo ""
	@grep -E '^##' $(MAKEFILE_LIST) | sed -e 's/## /  /' | column -t -s ':'
	@echo ""
	@echo "$(YELLOW)Quick start: make setup && make serve$(RESET)"

## setup: Create virtual environment and install dependencies
setup: $(VENV)/bin/activate install
	@echo "$(GREEN)✓ Setup complete!$(RESET)"

$(VENV)/bin/activate:
	@echo "$(CYAN)Creating virtual environment...$(RESET)"
	$(PYTHON) -m venv $(VENV)
	@echo "$(GREEN)✓ Virtual environment created$(RESET)"

## install: Install MkDocs and dependencies
install: $(VENV)/bin/activate
	@echo "$(CYAN)Installing dependencies...$(RESET)"
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	@echo "$(GREEN)✓ Dependencies installed$(RESET)"

## serve: Start the MkDocs development server
serve: check-deps
	@echo "$(CYAN)Starting MkDocs development server...$(RESET)"
	@echo "$(YELLOW)Server will be available at http://localhost:$(PORT)$(RESET)"
	@echo "$(YELLOW)Press Ctrl+C to stop$(RESET)"
	@echo ""
	$(MKDOCS) serve --dev-addr localhost:$(PORT)

## build: Build the static documentation site
build: check-deps
	@echo "$(CYAN)Building documentation...$(RESET)"
	$(MKDOCS) build --clean
	@echo "$(GREEN)✓ Documentation built in ./site/$(RESET)"

## clean: Remove generated files and virtual environment
clean:
	@echo "$(CYAN)Cleaning up...$(RESET)"
	@rm -rf site/
	@rm -rf .cache/
	@rm -rf $(VENV)/
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@echo "$(GREEN)✓ Cleaned up$(RESET)"

## deploy: Deploy to GitHub Pages (requires push permissions)
deploy: check-deps build
	@echo "$(CYAN)Deploying to GitHub Pages...$(RESET)"
	$(MKDOCS) gh-deploy --clean --message "Deploy documentation [skip ci]"
	@echo "$(GREEN)✓ Deployed successfully$(RESET)"

## test: Run documentation tests and checks
test: check-deps
	@echo "$(CYAN)Running documentation checks...$(RESET)"
	@echo "Checking for broken links..."
	$(MKDOCS) build --strict 2>&1 | tee build.log
	@if grep -q "WARNING" build.log; then \
		echo "$(YELLOW)⚠ Warnings found in documentation$(RESET)"; \
		grep "WARNING" build.log; \
		rm build.log; \
		exit 1; \
	else \
		echo "$(GREEN)✓ No warnings found$(RESET)"; \
		rm -f build.log; \
	fi

## check-deps: Verify all dependencies are installed
check-deps:
	@if [ ! -d "$(VENV)" ]; then \
		echo "$(RED)Error: Virtual environment not found!$(RESET)"; \
		echo "$(YELLOW)Run 'make setup' first$(RESET)"; \
		exit 1; \
	fi
	@if [ ! -f "$(MKDOCS)" ]; then \
		echo "$(RED)Error: MkDocs not installed!$(RESET)"; \
		echo "$(YELLOW)Run 'make install' to install dependencies$(RESET)"; \
		exit 1; \
	fi

## update: Update dependencies to latest versions
update: $(VENV)/bin/activate
	@echo "$(CYAN)Updating dependencies...$(RESET)"
	$(PIP) install --upgrade pip
	$(PIP) install --upgrade mkdocs mkdocs-material pymdown-extensions
	$(PIP) freeze > requirements.txt
	@echo "$(GREEN)✓ Dependencies updated$(RESET)"

## shell: Activate virtual environment in a new shell
shell: $(VENV)/bin/activate
	@echo "$(CYAN)Activating virtual environment...$(RESET)"
	@echo "$(YELLOW)Type 'exit' or Ctrl+D to leave$(RESET)"
	@bash --init-file <(echo "source $(VENV)/bin/activate; PS1='(venv) \$$PS1'")

## validate: Validate MkDocs configuration
validate: check-deps
	@echo "$(CYAN)Validating MkDocs configuration...$(RESET)"
	@$(PYTHON) -c "import yaml; yaml.safe_load(open('mkdocs.yml'))" && \
		echo "$(GREEN)✓ mkdocs.yml is valid YAML$(RESET)" || \
		echo "$(RED)✗ mkdocs.yml has YAML errors$(RESET)"
	@$(MKDOCS) build --dry-run > /dev/null 2>&1 && \
		echo "$(GREEN)✓ MkDocs configuration is valid$(RESET)" || \
		(echo "$(RED)✗ MkDocs configuration has errors$(RESET)"; \
		 echo "$(YELLOW)Run 'make check-files' to see missing files$(RESET)")

## check-files: Check for missing documentation files
check-files:
	@echo "$(CYAN)Checking for missing documentation files...$(RESET)"
	@$(PYTHON) -c "import yaml; config=yaml.safe_load(open('mkdocs.yml')); \
	nav=config.get('nav',[]); docs_dir=config.get('docs_dir','docs'); \
	import os; missing=[]; \
	def check_nav(items, base=docs_dir): \
		for item in items: \
			if isinstance(item, dict): \
				for k,v in item.items(): \
					if isinstance(v, str) and v.endswith('.md'): \
						if not os.path.exists(os.path.join(base, v)): \
							missing.append(v); \
					elif isinstance(v, list): \
						check_nav(v, base); \
	check_nav(nav); \
	if missing: \
		print('$(RED)Missing files in ' + docs_dir + ':$(RESET)'); \
		for f in missing: print('  - ' + f); \
		exit(1); \
	else: \
		print('$(GREEN)✓ All documentation files exist$(RESET)')"

## port: Serve on a different port (usage: make port PORT=8080)
port: check-deps
	@echo "$(CYAN)Starting MkDocs on port $(PORT)...$(RESET)"
	$(MKDOCS) serve --dev-addr localhost:$(PORT)

## watch: Build and watch for changes (no server)
watch: check-deps
	@echo "$(CYAN)Building and watching for changes...$(RESET)"
	$(MKDOCS) build --clean
	@echo "$(GREEN)✓ Initial build complete$(RESET)"
	@echo "$(YELLOW)Watching for changes... (Ctrl+C to stop)$(RESET)"
	@while true; do \
		$(MKDOCS) build 2>&1 | grep -v "INFO" | grep -v "Building" || true; \
		sleep 2; \
	done
