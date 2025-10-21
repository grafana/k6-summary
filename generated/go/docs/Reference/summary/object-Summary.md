---
title: <span class="badge object-type-struct"></span> Summary
---
# <span class="badge object-type-struct"></span> Summary

## Definition

```go
type Summary struct {
    // Configuration information about the test execution
    Config summary.SummarySummaryConfig `json:"config"`
    // Metadata about the summary generation
    Metadata summary.SummarySummaryMetadata `json:"metadata"`
    // Test execution results data
    Results summary.SummarySummaryResults `json:"results"`
    // Schema version in semver 2.0 format (e.g., '1.0.0')
    Version summary.SemVer `json:"version"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `Summary` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (summary *Summary) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `Summary` objects.

```go
func (summary *Summary) Equals(other Summary) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `Summary` fields for violations and returns them.

```go
func (summary *Summary) Validate() error
```

## See also

 * <span class="badge builder"></span> [SummaryBuilder](./builder-SummaryBuilder.md)
