---
title: <span class="badge object-type-struct"></span> RateValues
---
# <span class="badge object-type-struct"></span> RateValues

## Definition

```go
type RateValues struct {
    Matches int64 `json:"matches"`
    Total int64 `json:"total"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `RateValues` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (rateValues *RateValues) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `RateValues` objects.

```go
func (rateValues *RateValues) Equals(other RateValues) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `RateValues` fields for violations and returns them.

```go
func (rateValues *RateValues) Validate() error
```

## See also

 * <span class="badge builder"></span> [RateValuesBuilder](./builder-RateValuesBuilder.md)
