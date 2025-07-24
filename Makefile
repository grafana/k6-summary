# Makefile for k6-summary schema validation

# Control output verbosity (default: quiet)
VERBOSE ?= 0

ifeq ($(VERBOSE),1)
    Q =
else
    Q = @
endif

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
	@command -v jsonschema >/dev/null 2>&1 || { \
		echo "❌ jsonschema CLI not found"; \
		echo ""; \
		echo "Please install it using one of these methods:"; \
		echo "  • npm: npm install --global @sourcemeta/jsonschema"; \
		echo "  • Homebrew: brew install sourcemeta/apps/jsonschema"; \
		echo "  • More options: https://github.com/sourcemeta/jsonschema"; \
		echo ""; \
		exit 1; \
	}

validate-schema: check-jsonschema ## Validate the JSON schema against the meta-schema
	@echo "Validating JSON schemas"
ifeq ($(VERBOSE),1)
	@find schemas -name "schema.json" -type f | while read schema; do \
		echo "Validating $$schema..."; \
		jsonschema metaschema "$$schema"; \
	done
else
	@find schemas -name "schema.json" -type f | while read schema; do \
		jsonschema metaschema "$$schema" > /dev/null; \
	done
	@echo "✅ All schemas valid"
endif

validate-examples: check-jsonschema ## Validate the examples against the schema
	@echo "Validating examples against schema"
ifeq ($(VERBOSE),1)
	@find examples -name "*.json" -type f | while read example; do \
		echo "Validating $$(basename $$example)..."; \
		jsonschema validate --resolve schemas/metric/1.0.0/schema.json --resolve schemas/semver/2.0.0/schema.json schemas/summary/1.0.0/schema.json "$$example"; \
	done
else
	@find examples -name "*.json" -type f | while read example; do \
		if jsonschema validate --resolve schemas/metric/1.0.0/schema.json --resolve schemas/semver/2.0.0/schema.json schemas/summary/1.0.0/schema.json "$$example" > /dev/null 2>&1; then \
			echo "✅ $$(basename $$example)"; \
		else \
			echo "❌ $$(basename $$example) - Validation failed"; \
		fi; \
	done
endif