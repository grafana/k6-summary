---
title: <span class="badge object-type-struct"></span> SummarySummaryConfig
---
# <span class="badge object-type-struct"></span> SummarySummaryConfig

## Definition

```go
type SummarySummaryConfig struct {
    // Test run duration in seconds
    Duration float64 `json:"duration"`
    // Type of execution (local or cloud)
    Execution summary.SummarySummaryConfigExecution /* AnonymousEnumToExplicitType */ `json:"execution"`
    // Path or name of the test script
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Script *string `json:"script,omitempty"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `SummarySummaryConfig` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (summarySummaryConfig *SummarySummaryConfig) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `SummarySummaryConfig` objects.

```go
func (summarySummaryConfig *SummarySummaryConfig) Equals(other SummarySummaryConfig) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `SummarySummaryConfig` fields for violations and returns them.

```go
func (summarySummaryConfig *SummarySummaryConfig) Validate() error
```

## See also

 * <span class="badge builder"></span> [SummarySummaryConfigBuilder](./builder-SummarySummaryConfigBuilder.md)
