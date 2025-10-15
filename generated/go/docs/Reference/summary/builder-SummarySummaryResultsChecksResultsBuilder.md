---
title: <span class="badge builder"></span> SummarySummaryResultsChecksResultsBuilder
---
# <span class="badge builder"></span> SummarySummaryResultsChecksResultsBuilder

## Constructor

```go
func NewSummarySummaryResultsChecksResultsBuilder() *SummarySummaryResultsChecksResultsBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *SummarySummaryResultsChecksResultsBuilder) Build() (SummarySummaryResultsChecksResults, error)
```

### <span class="badge object-method"></span> Fails

Number of times the check failed

```go
func (builder *SummarySummaryResultsChecksResultsBuilder) Fails(fails int64) *SummarySummaryResultsChecksResultsBuilder
```

### <span class="badge object-method"></span> Name

Check name

```go
func (builder *SummarySummaryResultsChecksResultsBuilder) Name(name string) *SummarySummaryResultsChecksResultsBuilder
```

### <span class="badge object-method"></span> Passes

Number of times the check passed

```go
func (builder *SummarySummaryResultsChecksResultsBuilder) Passes(passes int64) *SummarySummaryResultsChecksResultsBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [SummarySummaryResultsChecksResults](./object-SummarySummaryResultsChecksResults.md)
