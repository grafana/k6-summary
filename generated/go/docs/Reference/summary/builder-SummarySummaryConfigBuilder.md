---
title: <span class="badge builder"></span> SummarySummaryConfigBuilder
---
# <span class="badge builder"></span> SummarySummaryConfigBuilder

## Constructor

```go
func NewSummarySummaryConfigBuilder() *SummarySummaryConfigBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *SummarySummaryConfigBuilder) Build() (SummarySummaryConfig, error)
```

### <span class="badge object-method"></span> Duration

Test run duration in seconds

```go
func (builder *SummarySummaryConfigBuilder) Duration(duration float64) *SummarySummaryConfigBuilder
```

### <span class="badge object-method"></span> Execution

Type of execution (local or cloud)

```go
func (builder *SummarySummaryConfigBuilder) Execution(execution summary.SummarySummaryConfigExecution /* AnonymousEnumToExplicitType */) *SummarySummaryConfigBuilder
```

### <span class="badge object-method"></span> Script

Path or name of the test script

```go
func (builder *SummarySummaryConfigBuilder) Script(script string) *SummarySummaryConfigBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [SummarySummaryConfig](./object-SummarySummaryConfig.md)
