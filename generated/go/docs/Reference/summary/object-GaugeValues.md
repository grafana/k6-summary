---
title: <span class="badge object-type-struct"></span> GaugeValues
---
# <span class="badge object-type-struct"></span> GaugeValues

## Definition

```go
type GaugeValues struct {
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Max *float64 `json:"max,omitempty"`
    // Modified by compiler pass 'NotRequiredFieldAsNullableType[nullable=true]'
    Min *float64 `json:"min,omitempty"`
    Value float64 `json:"value"`
}
```
## Methods

### <span class="badge object-method"></span> UnmarshalJSONStrict

UnmarshalJSONStrict implements a custom JSON unmarshalling logic to decode `GaugeValues` from JSON.

Note: the unmarshalling done by this function is strict. It will fail over required fields being absent from the input, fields having an incorrect type, unexpected fields being present, …

```go
func (gaugeValues *GaugeValues) UnmarshalJSONStrict(raw []byte) error
```

### <span class="badge object-method"></span> Equals

Equals tests the equality of two `GaugeValues` objects.

```go
func (gaugeValues *GaugeValues) Equals(other GaugeValues) bool
```

### <span class="badge object-method"></span> Validate

Validate checks all the validation constraints that may be defined on `GaugeValues` fields for violations and returns them.

```go
func (gaugeValues *GaugeValues) Validate() error
```

## See also

 * <span class="badge builder"></span> [GaugeValuesBuilder](./builder-GaugeValuesBuilder.md)
