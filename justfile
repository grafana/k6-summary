# Validate the JSON schema and examples
validate: validate-schema validate-examples

# Validate the JSON schema against the meta-schema
validate-schema:
    @echo "Validating JSON schema"
    deno run --allow-read validate-schema.ts summary.v1.schema.json

# Validate the examples against the schema
validate-examples:
    #!/usr/bin/env bash
    echo "Validating examples against schema"
    for example in examples/v1/*.json; do
        if [ -f "$example" ]; then
            deno run --allow-read --allow-net validate-example.ts "$example" summary.v1.schema.json
        fi
    done
