---
title: <span class="badge object-type-struct"></span> Metric
---
# <span class="badge object-type-struct"></span> Metric

## Definition

```go
type Metric struct {
    Contains summary.MetricContains /* AnonymousEnumToExplicitType */ `json:"contains"`
    Name string `json:"name"`
    Type summary.MetricType /* AnonymousEnumToExplicitType */ `json:"type"`
    Values any /* UndiscriminatedDisjunctionToAny */ `json:"values"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `Metric` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (metric *Metric) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `Metric` objects.

```go
func (metric *Metric) Equals(other Metric) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `Metric` fields for violations and returns them.

```go
func (metric *Metric) Validate() error
```

## See also

 * <span class="badge builder"></span> [MetricBuilder](./builder-MetricBuilder.md)
