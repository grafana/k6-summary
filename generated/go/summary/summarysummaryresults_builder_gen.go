// Code generated - EDITING IS FUTILE. DO NOT EDIT.
//
// Using jennies:
//     GoBuilder

package summary

import (
	cog "k6-summary/cog"
)

var _ cog.Builder[SummarySummaryResults] = (*SummarySummaryResultsBuilder)(nil)

type SummarySummaryResultsBuilder struct {
	internal *SummarySummaryResults
	errors   cog.BuildErrors
}

func NewSummarySummaryResultsBuilder() *SummarySummaryResultsBuilder {
	resource := NewSummarySummaryResults()
	builder := &SummarySummaryResultsBuilder{
		internal: resource,
		errors:   make(cog.BuildErrors, 0),
	}

	return builder
}

func (builder *SummarySummaryResultsBuilder) Build() (SummarySummaryResults, error) {
	if err := builder.internal.Validate(); err != nil {
		return SummarySummaryResults{}, err
	}

	if len(builder.errors) > 0 {
		return SummarySummaryResults{}, cog.MakeBuildErrors("summary.summarySummaryResults", builder.errors)
	}

	return *builder.internal, nil
}

// Check execution results
func (builder *SummarySummaryResultsBuilder) Checks(checks cog.Builder[SummarySummaryResultsChecks]) *SummarySummaryResultsBuilder {
	checksResource, err := checks.Build()
	if err != nil {
		builder.errors = append(builder.errors, err.(cog.BuildErrors)...)
		return builder
	}
	builder.internal.Checks = &checksResource

	return builder
}

// Array of all metrics from the test execution
func (builder *SummarySummaryResultsBuilder) Metrics(metrics []cog.Builder[Metric]) *SummarySummaryResultsBuilder {
	metricsResources := make([]Metric, 0, len(metrics))
	for _, r1 := range metrics {
		metricsDepth1, err := r1.Build()
		if err != nil {
			builder.errors = append(builder.errors, err.(cog.BuildErrors)...)
			return builder
		}
		metricsResources = append(metricsResources, metricsDepth1)
	}
	builder.internal.Metrics = metricsResources

	return builder
}

// Whether the test passed (true) or failed (false). Determined by threshold evaluations and other test criteria.
func (builder *SummarySummaryResultsBuilder) Passed(passed bool) *SummarySummaryResultsBuilder {
	builder.internal.Passed = passed

	return builder
}
