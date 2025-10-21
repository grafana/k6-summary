---
title: <span class="badge object-type-struct"></span> SummarySummaryResults
---
# <span class="badge object-type-struct"></span> SummarySummaryResults

## Definition

```go
type SummarySummaryResults struct {
    // Check execution results
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Checks *summary.SummarySummaryResultsChecks `json:"checks,omitempty"`
    // Array of all metrics from the test execution
    Metrics []summary.Metric `json:"metrics"`
    // Whether the test passed (true) or failed (false). Determined by threshold evaluations and other test criteria.
    Passed bool `json:"passed"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `SummarySummaryResults` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (summarySummaryResults *SummarySummaryResults) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `SummarySummaryResults` objects.

```go
func (summarySummaryResults *SummarySummaryResults) Equals(other SummarySummaryResults) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `SummarySummaryResults` fields for violations and returns them.

```go
func (summarySummaryResults *SummarySummaryResults) Validate() error
```

## See also

 * <span class="badge builder"></span> [SummarySummaryResultsBuilder](./builder-SummarySummaryResultsBuilder.md)
