package main

import (
	"regexp"
	"strings"
	"fmt"
)

type Any interface {}

type Mapper func(Any) Any

type Predicate func(Any) bool

type Accumulator func(Any, Any) Any

type Stream interface {
	Map(m Mapper) Stream
	Filter(p Predicate) Stream
	Reduce(a Accumulator) Any
}

type StreamImpl struct {
	items []Any
	Stream
}

func (s StreamImpl) Map(m Mapper) StreamImpl {
	for i, item := range s.items {
		s.items[i] = m(item)
	}
	return s
}

func (s StreamImpl) Filter(p Predicate) StreamImpl {
	var items []Any
	for _, item := range s.items {
		if p(item) {
			items = append(items, item)
		}
	}
	s.items = items
	return s
}

func (s StreamImpl) Reduce(a Accumulator) Any {
	var result Any
	for _, item := range s.items {
		result = a(result, item)
	}
	return result
}

func ToStream(items []Any) StreamImpl {
	stream := StreamImpl{}
	stream.items = items
	return stream
}

func toUpperCase(s Any) Any {
	return strings.ToUpper(s.(string))
}

func notDigit(s Any) bool {
	matched, err := regexp.MatchString("\\D+", s.(string))
	if err != nil {
		return false
	}
	return matched
}

func concat(acc, value Any) Any {
	if acc == nil {
		return value
	}
	return acc.(string) + "," + value.(string)
}

func main() {
	stringSlice := []Any{"a", "b", "c", "1", "D"}
	// Map/Reduce
	result := ToStream(stringSlice).
		Map(toUpperCase).
		Filter(notDigit).
		Reduce(concat).(string)
	fmt.Println(result)
}