---
title: <span class="badge builder"></span> MetricBuilder
---
# <span class="badge builder"></span> MetricBuilder

## Constructor

```go
func NewMetricBuilder() *MetricBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *MetricBuilder) Build() (Metric, error)
```

### <span class="badge object-method"></span> Contains

```go
func (builder *MetricBuilder) Contains(contains summary.MetricContains /* AnonymousEnumToExplicitType */) *MetricBuilder
```

### <span class="badge object-method"></span> Name

```go
func (builder *MetricBuilder) Name(name string) *MetricBuilder
```

### <span class="badge object-method"></span> Type

```go
func (builder *MetricBuilder) Type(typeArg summary.MetricType /* AnonymousEnumToExplicitType */) *MetricBuilder
```

### <span class="badge object-method"></span> Values

```go
func (builder *MetricBuilder) Values(values any /* UndiscriminatedDisjunctionToAny */) *MetricBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [Metric](./object-Metric.md)
