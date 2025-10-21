---
title: <span class="badge builder"></span> TrendValuesBuilder
---
# <span class="badge builder"></span> TrendValuesBuilder

## Constructor

```go
func NewTrendValuesBuilder() *TrendValuesBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *TrendValuesBuilder) Build() (TrendValues, error)
```

### <span class="badge object-method"></span> Avg

```go
func (builder *TrendValuesBuilder) Avg(avg float64) *TrendValuesBuilder
```

### <span class="badge object-method"></span> Count

```go
func (builder *TrendValuesBuilder) Count(count int64) *TrendValuesBuilder
```

### <span class="badge object-method"></span> Max

```go
func (builder *TrendValuesBuilder) Max(max float64) *TrendValuesBuilder
```

### <span class="badge object-method"></span> Med

```go
func (builder *TrendValuesBuilder) Med(med float64) *TrendValuesBuilder
```

### <span class="badge object-method"></span> Min

```go
func (builder *TrendValuesBuilder) Min(min float64) *TrendValuesBuilder
```

### <span class="badge object-method"></span> P90

```go
func (builder *TrendValuesBuilder) P90(p90 float64) *TrendValuesBuilder
```

### <span class="badge object-method"></span> P95

```go
func (builder *TrendValuesBuilder) P95(p95 float64) *TrendValuesBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [TrendValues](./object-TrendValues.md)
