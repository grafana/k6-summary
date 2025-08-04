# k6-summary

This repository contains the official JSON Schema definitions and examples for k6's machine-readable end-of-test summary format.

## Overview

The k6-summary project provides:

- **JSON Schema 2020-12 files** that describe and enforce the format of the machine-readable end-of-test summary that k6 emits
- **Example files** demonstrating what compliant output looks like
- **Versioned schemas** designed for automated data model and client code generation

This format enables reliable automation and integration with k6 in CI/CD environments by providing a stable, officially supported alternative to parsing human-readable text summaries.

## Primary Use Cases

- **CI/CD Integration**: Automate test result processing in continuous integration pipelines
- **Code Generation**: Generate client libraries and data model code from the schemas
- **Data Analysis**: Build tools that consume k6 test results programmatically
- **Monitoring Integration**: Feed k6 metrics into observability platforms

## Main Schema

The primary schema that users should focus on is:

- **`schemas/summary/1.0.0/schema.json`** - Defines the complete k6 end-of-test summary format

Supporting schemas include:
- **`schemas/metric/1.0.0/schema.json`** - Defines individual metric structures
- **`schemas/semver/2.0.0/schema.json`** - Validates semantic version strings

## Examples

Example files demonstrating schema compliance can be found in the `examples/` directory:

- `examples/v1/example-summary-v1-basic.json` - Basic usage example with core metrics

## Validation

To validate that changes to the schemas are correct and that examples comply with the schemas:

```bash
make validate
```

For verbose output showing detailed validation steps:

```bash
make validate VERBOSE=1
```

## Versioning

Schema versioning follows semantic versioning principles and is reflected in both the `$id` field and the directory structure:

### Schema IDs
Each schema has a unique `$id` that follows the pattern:
```
https://schemas.k6.io/{schema-name}/{version}/schema.json
```

Examples:
- `https://schemas.k6.io/summary/1.0.0/schema.json`
- `https://schemas.k6.io/metric/1.0.0/schema.json`
- `https://schemas.k6.io/semver/2.0.0/schema.json`

### Directory Structure
The `schemas/` folder mirrors the versioning scheme:

```
schemas/
├── summary/
│   └── 1.0.0/
│       └── schema.json
├── metric/
│   └── 1.0.0/
│       └── schema.json
└── semver/
    └── 2.0.0/
        └── schema.json
```

This structure allows for clean evolution of schemas while maintaining backward compatibility. Future versions can be added alongside existing ones (e.g., `schemas/summary/2.0.0/schema.json`).

## Contributing

When making changes to schemas:

1. Ensure backward compatibility for patch and minor version updates
2. Update examples to reflect schema changes
3. Run `make validate` to verify all schemas and examples are valid
4. Consider the impact on existing client code and tooling