---
title: <span class="badge builder"></span> SummarySummaryResultsChecksBuilder
---
# <span class="badge builder"></span> SummarySummaryResultsChecksBuilder

## Constructor

```go
func NewSummarySummaryResultsChecksBuilder() *SummarySummaryResultsChecksBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *SummarySummaryResultsChecksBuilder) Build() (SummarySummaryResultsChecks, error)
```

### <span class="badge object-method"></span> Metrics

Array of check-related metrics

```go
func (builder *SummarySummaryResultsChecksBuilder) Metrics(metrics []cog.Builder[summary.Metric]) *SummarySummaryResultsChecksBuilder
```

### <span class="badge object-method"></span> Results

Individual check results in execution order

```go
func (builder *SummarySummaryResultsChecksBuilder) Results(results []cog.Builder[summary.SummarySummaryResultsChecksResults]) *SummarySummaryResultsChecksBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [SummarySummaryResultsChecks](./object-SummarySummaryResultsChecks.md)
