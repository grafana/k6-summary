// Code generated - EDITING IS FUTILE. DO NOT EDIT.
//
// Using jennies:
//     GoBuilder

package summary

import (
	cog "k6-summary/cog"
)

var _ cog.Builder[TrendValues] = (*TrendValuesBuilder)(nil)

type TrendValuesBuilder struct {
	internal *TrendValues
	errors   cog.BuildErrors
}

func NewTrendValuesBuilder() *TrendValuesBuilder {
	resource := NewTrendValues()
	builder := &TrendValuesBuilder{
		internal: resource,
		errors:   make(cog.BuildErrors, 0),
	}

	return builder
}

func (builder *TrendValuesBuilder) Build() (TrendValues, error) {
	if err := builder.internal.Validate(); err != nil {
		return TrendValues{}, err
	}

	if len(builder.errors) > 0 {
		return TrendValues{}, cog.MakeBuildErrors("summary.trendValues", builder.errors)
	}

	return *builder.internal, nil
}

func (builder *TrendValuesBuilder) Avg(avg float64) *TrendValuesBuilder {
	builder.internal.Avg = &avg

	return builder
}

func (builder *TrendValuesBuilder) Count(count int64) *TrendValuesBuilder {
	builder.internal.Count = &count

	return builder
}

func (builder *TrendValuesBuilder) Max(max float64) *TrendValuesBuilder {
	builder.internal.Max = &max

	return builder
}

func (builder *TrendValuesBuilder) Med(med float64) *TrendValuesBuilder {
	builder.internal.Med = &med

	return builder
}

func (builder *TrendValuesBuilder) Min(min float64) *TrendValuesBuilder {
	builder.internal.Min = &min

	return builder
}

func (builder *TrendValuesBuilder) P90(p90 float64) *TrendValuesBuilder {
	builder.internal.P90 = &p90

	return builder
}

func (builder *TrendValuesBuilder) P95(p95 float64) *TrendValuesBuilder {
	builder.internal.P95 = &p95

	return builder
}
