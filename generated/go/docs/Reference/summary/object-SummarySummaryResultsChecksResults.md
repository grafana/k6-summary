---
title: <span class="badge object-type-struct"></span> SummarySummaryResultsChecksResults
---
# <span class="badge object-type-struct"></span> SummarySummaryResultsChecksResults

## Definition

```go
type SummarySummaryResultsChecksResults struct {
    // Number of times the check failed
    Fails int64 `json:"fails"`
    // Check name
    Name string `json:"name"`
    // Number of times the check passed
    Passes int64 `json:"passes"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `SummarySummaryResultsChecksResults` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (summarySummaryResultsChecksResults *SummarySummaryResultsChecksResults) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `SummarySummaryResultsChecksResults` objects.

```go
func (summarySummaryResultsChecksResults *SummarySummaryResultsChecksResults) Equals(other SummarySummaryResultsChecksResults) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `SummarySummaryResultsChecksResults` fields for violations and returns them.

```go
func (summarySummaryResultsChecksResults *SummarySummaryResultsChecksResults) Validate() error
```

## See also

 * <span class="badge builder"></span> [SummarySummaryResultsChecksResultsBuilder](./builder-SummarySummaryResultsChecksResultsBuilder.md)
