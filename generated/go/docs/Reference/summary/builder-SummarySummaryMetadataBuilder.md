---
title: <span class="badge builder"></span> SummarySummaryMetadataBuilder
---
# <span class="badge builder"></span> SummarySummaryMetadataBuilder

## Constructor

```go
func NewSummarySummaryMetadataBuilder() *SummarySummaryMetadataBuilder
```
## Methods

### <span class="badge object-method"></span> Build

Builds the object.

```go
func (builder *SummarySummaryMetadataBuilder) Build() (SummarySummaryMetadata, error)
```

### <span class="badge object-method"></span> GeneratedAt

RFC3339 timestamp when summary was generated

```go
func (builder *SummarySummaryMetadataBuilder) GeneratedAt(generatedAt time.Time) *SummarySummaryMetadataBuilder
```

### <span class="badge object-method"></span> K6Version

Version of k6 that generated this summary

```go
func (builder *SummarySummaryMetadataBuilder) K6Version(k6Version summary.SemVer) *SummarySummaryMetadataBuilder
```

## See also

 * <span class="badge object-type-struct"></span> [SummarySummaryMetadata](./object-SummarySummaryMetadata.md)
