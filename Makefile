# Makefile for k6-summary schema validation

# Control output verbosity (default: quiet)
VERBOSE ?= 0

CHECK_METASCHEMA_FLAGS := --quiet
ifeq ($(VERBOSE),1)
	CHECK_METASCHEMA_FLAGS := --verbose
endif

# Find all schema.json files recursively
SCHEMAS := $(shell find schemas -type f -name 'schema.json')

# Find all example files recursively
EXAMPLES := $(shell find examples -type f -name '*.json')

.PHONY: help validate validate-schema validate-examples check-jsonschema

help: ## Show available targets
	@echo "Available targets:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Options:"
	@echo "  VERBOSE=1           Show detailed output (default: quiet mode)"
	@echo ""
	@echo "Examples:"
	@echo "  make validate       # Run validation quietly"
	@echo "  make validate VERBOSE=1  # Run validation with full output"

validate: validate-schema validate-examples ## Validate the JSON schema and examples

check-jsonschema: ## Check if jsonschema CLI is installed
	@command -v check-jsonschema >/dev/null 2>&1 || { \
		echo "❌ check-jsonschema CLI not found"; \
		echo ""; \
		echo "Please install it using one of these methods:"; \
		echo "  • pip: pipx install check-jsonschema"; \
		echo "  • Homebrew: brew install check-jsonschema"; \
		echo "  • More options: https://github.com/python-jsonschema/check-jsonschema"; \
		echo ""; \
		exit 1; \
	}

validate-schema: check-jsonschema ## Validate the JSON schemas against the meta-schema
	@[ "$(VERBOSE)" = "1" ] && echo "🔍 Checking all schemas..." || true
	@errors=0; \
	for f in $(SCHEMAS); do \
	  [ "$(VERBOSE)" = "1" ] && echo "→ Checking $$f" || true; \
	  if ! check-jsonschema $(CHECK_METASCHEMA_FLAGS) --check-metaschema "$$f"; then \
		echo "❌ Failed: $$f"; \
		errors=1; \
	  fi; \
	done; \
	if [ $$errors -eq 0 ]; then \
	  echo "✅ All schemas validated successfully."; \
	else \
	  echo "🚨 Some schemas failed validation."; \
	  exit 1; \
	fi

validate-examples: check-jsonschema ## Validate the examples against the schema
	@[ "$(VERBOSE)" = "1" ] && echo "🔍 Checking all examples..." || true
	@errors=0; \
	for f in $(EXAMPLES); do \
	  [ "$(VERBOSE)" = "1" ] && echo "→ Checking $$f" || true; \
	  if ! check-jsonschema $(CHECK_METASCHEMA_FLAGS) --schemafile schemas/summary/1.0.0/schema.json "$$f"; then \
		echo "❌ Failed: $$f"; \
		errors=1; \
	  fi; \
	done; \
	if [ $$errors -eq 0 ]; then \
	  echo "✅ All examples validated successfully."; \
	else \
	  echo "🚨 Some examples failed validation."; \
	  exit 1; \
	fi
