// Code generated - EDITING IS FUTILE. DO NOT EDIT.
//
// Using jennies:
//     GoBuilder

package summary

import (
	cog "k6-summary/cog"
)

var _ cog.Builder[RateValues] = (*RateValuesBuilder)(nil)

type RateValuesBuilder struct {
	internal *RateValues
	errors   cog.BuildErrors
}

func NewRateValuesBuilder() *RateValuesBuilder {
	resource := NewRateValues()
	builder := &RateValuesBuilder{
		internal: resource,
		errors:   make(cog.BuildErrors, 0),
	}

	return builder
}

func (builder *RateValuesBuilder) Build() (RateValues, error) {
	if err := builder.internal.Validate(); err != nil {
		return RateValues{}, err
	}

	if len(builder.errors) > 0 {
		return RateValues{}, cog.MakeBuildErrors("summary.rateValues", builder.errors)
	}

	return *builder.internal, nil
}

func (builder *RateValuesBuilder) Matches(matches int64) *RateValuesBuilder {
	builder.internal.Matches = matches

	return builder
}

func (builder *RateValuesBuilder) Total(total int64) *RateValuesBuilder {
	builder.internal.Total = total

	return builder
}
