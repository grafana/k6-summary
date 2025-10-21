---
title: <span class="badge object-type-struct"></span> TrendValues
---
# <span class="badge object-type-struct"></span> TrendValues

## Definition

```go
type TrendValues struct {
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Avg *float64 `json:"avg,omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Count *int64 `json:"count,omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Max *float64 `json:"max,omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Med *float64 `json:"med,omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Min *float64 `json:"min,omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    P90 *float64 `json:"p(90),omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    P95 *float64 `json:"p(95),omitempty"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `TrendValues` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (trendValues *TrendValues) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `TrendValues` objects.

```go
func (trendValues *TrendValues) Equals(other TrendValues) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `TrendValues` fields for violations and returns them.

```go
func (trendValues *TrendValues) Validate() error
```

## See also

 * <span class="badge builder"></span> [TrendValuesBuilder](./builder-TrendValuesBuilder.md)
