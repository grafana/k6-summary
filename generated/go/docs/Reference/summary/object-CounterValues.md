---
title: <span class="badge object-type-struct"></span> CounterValues
---
# <span class="badge object-type-struct"></span> CounterValues

## Definition

```go
type CounterValues struct {
    Count float64 `json:"count"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `CounterValues` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (counterValues *CounterValues) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `CounterValues` objects.

```go
func (counterValues *CounterValues) Equals(other CounterValues) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `CounterValues` fields for violations and returns them.

```go
func (counterValues *CounterValues) Validate() error
```

## See also

 * <span class="badge builder"></span> [CounterValuesBuilder](./builder-CounterValuesBuilder.md)
