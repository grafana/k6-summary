# Makefile for k6-summary schema validation

# Control output verbosity (default: quiet)
VERBOSE ?= 0

ifeq ($(VERBOSE),1)
    Q =
else
    Q = @
endif

.PHONY: help validate validate-schema validate-examples

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

validate-schema: ## Validate the JSON schema against the meta-schema
	@echo "Validating JSON schemas"
ifeq ($(VERBOSE),1)
	deno run --allow-read validate-schema.ts schemas/v1/summary.v1.schema.json
	deno run --allow-read validate-schema.ts schemas/v1/metric.v1.schema.json
else
	@deno run --allow-read validate-schema.ts schemas/v1/summary.v1.schema.json > /dev/null
	@deno run --allow-read validate-schema.ts schemas/v1/metric.v1.schema.json > /dev/null
	@echo "✅ All schemas valid"
endif

validate-examples: ## Validate the examples against the schema
	@echo "Validating examples against schema"
ifeq ($(VERBOSE),1)
	for example in examples/v1/*.json; do \
		if [ -f "$$example" ]; then \
			deno run --allow-read --allow-net validate-example.ts "$$example" schemas/v1/summary.v1.schema.json; \
		fi \
	done
else
	@for example in examples/v1/*.json; do \
		if [ -f "$$example" ]; then \
			deno run --allow-read --allow-net validate-example.ts "$$example" schemas/v1/summary.v1.schema.json > /dev/null && echo "✅ $$(basename $$example)"; \
		fi \
	done
endif