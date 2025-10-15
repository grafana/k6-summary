---
title: <span class="badge builder"></span> SummarySummaryResultsBuilder
---
# <span class="badge builder"></span> SummarySummaryResultsBuilder

## Constructor

```go
func NewSummarySummaryResultsBuilder() *SummarySummaryResultsBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *SummarySummaryResultsBuilder) Build() (SummarySummaryResults, error)
```

### <span class="badge object-method"></span> Checks

Check execution results

```go
func (builder *SummarySummaryResultsBuilder) Checks(checks cog.Builder[summary.SummarySummaryResultsChecks]) *SummarySummaryResultsBuilder
```

### <span class="badge object-method"></span> Metrics

Array of all metrics from the test execution

```go
func (builder *SummarySummaryResultsBuilder) Metrics(metrics []cog.Builder[summary.Metric]) *SummarySummaryResultsBuilder
```

### <span class="badge object-method"></span> Passed

Whether the test passed (true) or failed (false). Determined by threshold evaluations and other test criteria.

```go
func (builder *SummarySummaryResultsBuilder) Passed(passed bool) *SummarySummaryResultsBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [SummarySummaryResults](./object-SummarySummaryResults.md)
