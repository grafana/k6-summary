---
title: <span class="badge builder"></span> SummaryBuilder
---
# <span class="badge builder"></span> SummaryBuilder

## Constructor

```go
func NewSummaryBuilder() *SummaryBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *SummaryBuilder) Build() (Summary, error)
```

### <span class="badge object-method"></span> Config

Configuration information about the test execution

```go
func (builder *SummaryBuilder) Config(config cog.Builder[summary.SummarySummaryConfig]) *SummaryBuilder
```

### <span class="badge object-method"></span> Metadata

Metadata about the summary generation

```go
func (builder *SummaryBuilder) Metadata(metadata cog.Builder[summary.SummarySummaryMetadata]) *SummaryBuilder
```

### <span class="badge object-method"></span> Results

Test execution results data

```go
func (builder *SummaryBuilder) Results(results cog.Builder[summary.SummarySummaryResults]) *SummaryBuilder
```

### <span class="badge object-method"></span> Version

Schema version in semver 2.0 format (e.g., '1.0.0')

```go
func (builder *SummaryBuilder) Version(version summary.SemVer) *SummaryBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [Summary](./object-Summary.md)
