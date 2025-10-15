// Code generated from JSON Schema using quicktype. DO NOT EDIT.
// To parse and unparse this JSON data, add this code to your project and do:
//
//    summary, err := UnmarshalSummary(bytes)
//    bytes, err = summary.Marshal()

package summary

import "bytes"
import "errors"
import "time"

import "encoding/json"

func UnmarshalSummary(data []byte) (Summary, error) {
	var r Summary
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Summary) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

// Official JSON schema for k6's machine-readable end-of-test summary format version 1.0
type Summary struct {
	// Configuration information about the test execution          
	Config                                                Config   `json:"config"`
	// Metadata about the summary generation                       
	Metadata                                              Metadata `json:"metadata"`
	// Test execution results data                                 
	Results                                               Results  `json:"results"`
	// Schema version in semver 2.0 format (e.g., '1.0.0')         
	Version                                               string   `json:"version"`
}

// Configuration information about the test execution
type Config struct {
	// Test run duration in seconds                
	Duration                             float64   `json:"duration"`
	// Type of execution (local or cloud)          
	Execution                            Execution `json:"execution"`
	// Path or name of the test script             
	Script                               *string   `json:"script,omitempty"`
}

// Metadata about the summary generation
type Metadata struct {
	// RFC3339 timestamp when summary was generated          
	GeneratedAt                                    time.Time `json:"generatedAt"`
	// Version of k6 that generated this summary             
	K6Version                                      string    `json:"k6Version"`
}

// Test execution results data
type Results struct {
	// Check execution results                                                                                     
	Checks                                                                                      *Checks            `json:"checks,omitempty"`
	// Array of all metrics from the test execution                                                                
	Metrics                                                                                     []K6MetricSchemaV1 `json:"metrics"`
	// Whether the test passed (true) or failed (false). Determined by threshold evaluations and                   
	// other test criteria.                                                                                        
	Passed                                                                                      bool               `json:"passed"`
}

// Check execution results
type Checks struct {
	// Array of check-related metrics                                
	Metrics                                       []K6MetricSchemaV1 `json:"metrics,omitempty"`
	// Individual check results in execution order                   
	Results                                       []Result           `json:"results,omitempty"`
}

// JSON schema for k6 metric objects
//
// Base properties for all metrics
type K6MetricSchemaV1 struct {
	// The type of data the metric contains                     
	Contains                                           Contains `json:"contains"`
	// The metric name                                          
	Name                                               string   `json:"name"`
	// The metric type                                          
	Type                                               Type     `json:"type"`
	// Counter metric values                                    
	//                                                          
	// Gauge metric values                                      
	//                                                          
	// Rate metric values                                       
	//                                                          
	// Trend metric values with configurable statistics         
	Values                                             Values   `json:"values"`
}

// Counter metric values
//
// Gauge metric values
//
// Rate metric values
//
// Trend metric values with configurable statistics
type Values struct {
	// Total count of events                            
	//                                                  
	// Number of data points                            
	Count                                      *Count   `json:"count"`
	// Maximum observed value                           
	//                                                  
	// Maximum value                                    
	Max                                        *float64 `json:"max,omitempty"`
	// Minimum observed value                           
	//                                                  
	// Minimum value                                    
	Min                                        *float64 `json:"min,omitempty"`
	// Current/final gauge value                        
	Value                                      *float64 `json:"value,omitempty"`
	// Number of successful events                      
	Matches                                    *int64   `json:"matches,omitempty"`
	// Total number of events (matches + fails)         
	Total                                      *int64   `json:"total,omitempty"`
	// Average (mean) value                             
	Avg                                        *float64 `json:"avg,omitempty"`
	// Median value                                     
	Med                                        *float64 `json:"med,omitempty"`
	// 90th percentile                                  
	P90                                        *float64 `json:"p(90),omitempty"`
	// 95th percentile                                  
	P95                                        *float64 `json:"p(95),omitempty"`
}

type Result struct {
	// Number of times the check failed       
	Fails                              int64  `json:"fails"`
	// Check name                             
	Name                               string `json:"name"`
	// Number of times the check passed       
	Passes                             int64  `json:"passes"`
}

// Type of execution (local or cloud)
type Execution string

const (
	Cloud Execution = "cloud"
	Local Execution = "local"
)

// The type of data the metric contains
type Contains string

const (
	Data    Contains = "data"
	Default Contains = "default"
	Time    Contains = "time"
)

// The metric type
type Type string

const (
	Counter Type = "counter"
	Gauge   Type = "gauge"
	Rate    Type = "rate"
	Trend   Type = "trend"
)

type Count struct {
	Double  *float64
	Integer *int64
}

func (x *Count) UnmarshalJSON(data []byte) error {
	object, err := unmarshalUnion(data, &x.Integer, &x.Double, nil, nil, false, nil, false, nil, false, nil, false, nil, false)
	if err != nil {
		return err
	}
	if object {
	}
	return nil
}

func (x *Count) MarshalJSON() ([]byte, error) {
	return marshalUnion(x.Integer, x.Double, nil, nil, false, nil, false, nil, false, nil, false, nil, false)
}

func unmarshalUnion(data []byte, pi **int64, pf **float64, pb **bool, ps **string, haveArray bool, pa interface{}, haveObject bool, pc interface{}, haveMap bool, pm interface{}, haveEnum bool, pe interface{}, nullable bool) (bool, error) {
	if pi != nil {
			*pi = nil
	}
	if pf != nil {
			*pf = nil
	}
	if pb != nil {
			*pb = nil
	}
	if ps != nil {
			*ps = nil
	}

	dec := json.NewDecoder(bytes.NewReader(data))
	dec.UseNumber()
	tok, err := dec.Token()
	if err != nil {
			return false, err
	}

	switch v := tok.(type) {
	case json.Number:
			if pi != nil {
					i, err := v.Int64()
					if err == nil {
							*pi = &i
							return false, nil
					}
			}
			if pf != nil {
					f, err := v.Float64()
					if err == nil {
							*pf = &f
							return false, nil
					}
					return false, errors.New("Unparsable number")
			}
			return false, errors.New("Union does not contain number")
	case float64:
			return false, errors.New("Decoder should not return float64")
	case bool:
			if pb != nil {
					*pb = &v
					return false, nil
			}
			return false, errors.New("Union does not contain bool")
	case string:
			if haveEnum {
					return false, json.Unmarshal(data, pe)
			}
			if ps != nil {
					*ps = &v
					return false, nil
			}
			return false, errors.New("Union does not contain string")
	case nil:
			if nullable {
					return false, nil
			}
			return false, errors.New("Union does not contain null")
	case json.Delim:
			if v == '{' {
					if haveObject {
							return true, json.Unmarshal(data, pc)
					}
					if haveMap {
							return false, json.Unmarshal(data, pm)
					}
					return false, errors.New("Union does not contain object")
			}
			if v == '[' {
					if haveArray {
							return false, json.Unmarshal(data, pa)
					}
					return false, errors.New("Union does not contain array")
			}
			return false, errors.New("Cannot handle delimiter")
	}
	return false, errors.New("Cannot unmarshal union")
}

func marshalUnion(pi *int64, pf *float64, pb *bool, ps *string, haveArray bool, pa interface{}, haveObject bool, pc interface{}, haveMap bool, pm interface{}, haveEnum bool, pe interface{}, nullable bool) ([]byte, error) {
	if pi != nil {
			return json.Marshal(*pi)
	}
	if pf != nil {
			return json.Marshal(*pf)
	}
	if pb != nil {
			return json.Marshal(*pb)
	}
	if ps != nil {
			return json.Marshal(*ps)
	}
	if haveArray {
			return json.Marshal(pa)
	}
	if haveObject {
			return json.Marshal(pc)
	}
	if haveMap {
			return json.Marshal(pm)
	}
	if haveEnum {
			return json.Marshal(pe)
	}
	if nullable {
			return json.Marshal(nil)
	}
	return nil, errors.New("Union must not be null")
}
