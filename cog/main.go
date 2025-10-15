package main

import (
	"context"
	"fmt"

	"github.com/grafana/cog"
)

func main() {
	files, err := cog.TypesFromSchema().
		CUEModule("/path/to/cue/module").
		SchemaTransformations(
			cog.AppendCommentToObjects("Transformed by cog."),
			cog.PrefixObjectsNames("Example"),
		).
		Golang(cog.GoConfig{}).
		Run(context.Background())
	if err != nil {
		panic(err)
	}

	if len(files) != 1 {
		panic("expected a single file :(")
	}

	fmt.Println(string(files[0].Data))
}
