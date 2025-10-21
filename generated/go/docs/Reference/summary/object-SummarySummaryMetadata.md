---
title: <span class="badge object-type-struct"></span> SummarySummaryMetadata
---
# <span class="badge object-type-struct"></span> SummarySummaryMetadata

## Definition

```go
type SummarySummaryMetadata struct {
    // RFC3339 timestamp when summary was generated
    GeneratedAt time.Time `json:"generatedAt"`
    // Version of k6 that generated this summary
    K6Version summary.SemVer `json:"k6Version"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `SummarySummaryMetadata` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (summarySummaryMetadata *SummarySummaryMetadata) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `SummarySummaryMetadata` objects.

```go
func (summarySummaryMetadata *SummarySummaryMetadata) Equals(other SummarySummaryMetadata) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `SummarySummaryMetadata` fields for violations and returns them.

```go
func (summarySummaryMetadata *SummarySummaryMetadata) Validate() error
```

## See also

 * <span class="badge builder"></span> [SummarySummaryMetadataBuilder](./builder-SummarySummaryMetadataBuilder.md)
