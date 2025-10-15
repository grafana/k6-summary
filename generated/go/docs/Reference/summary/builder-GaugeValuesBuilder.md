---
title: <span class="badge builder"></span> GaugeValuesBuilder
---
# <span class="badge builder"></span> GaugeValuesBuilder

## Constructor

```go
func NewGaugeValuesBuilder() *GaugeValuesBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *GaugeValuesBuilder) Build() (GaugeValues, error)
```

### <span class="badge object-method"></span> Max

```go
func (builder *GaugeValuesBuilder) Max(max float64) *GaugeValuesBuilder
```

### <span class="badge object-method"></span> Min

```go
func (builder *GaugeValuesBuilder) Min(min float64) *GaugeValuesBuilder
```

### <span class="badge object-method"></span> Value

```go
func (builder *GaugeValuesBuilder) Value(value float64) *GaugeValuesBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [GaugeValues](./object-GaugeValues.md)
