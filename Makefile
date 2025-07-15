# Makefile for k6-summary schema validation

.PHONY: help validate validate-schema validate-examples

help: ## Show available targets
	@echo "Available targets:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""

validate: validate-schema validate-examples ## Validate the JSON schema and examples

validate-schema: ## Validate the JSON schema against the meta-schema
	@echo "Validating JSON schema"
	deno run --allow-read validate-schema.ts summary.v1.schema.json

validate-examples: ## Validate the examples against the schema
	@echo "Validating examples against schema"
	@for example in examples/v1/*.json; do \
		if [ -f "$$example" ]; then \
			deno run --allow-read --allow-net validate-example.ts "$$example" summary.v1.schema.json; \
		fi \
	done