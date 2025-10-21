---
title: <span class="badge object-type-struct"></span> SummarySummaryResultsChecks
---
# <span class="badge object-type-struct"></span> SummarySummaryResultsChecks

## Definition

```go
type SummarySummaryResultsChecks struct {
    // Array of check-related metrics
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Metrics []summary.Metric `json:"metrics,omitempty"`
    // Individual check results in execution order
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Results []summary.SummarySummaryResultsChecksResults `json:"results,omitempty"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `SummarySummaryResultsChecks` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (summarySummaryResultsChecks *SummarySummaryResultsChecks) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `SummarySummaryResultsChecks` objects.

```go
func (summarySummaryResultsChecks *SummarySummaryResultsChecks) Equals(other SummarySummaryResultsChecks) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `SummarySummaryResultsChecks` fields for violations and returns them.

```go
func (summarySummaryResultsChecks *SummarySummaryResultsChecks) Validate() error
```

## See also

 * <span class="badge builder"></span> [SummarySummaryResultsChecksBuilder](./builder-SummarySummaryResultsChecksBuilder.md)
