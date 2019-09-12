package main

import (
	"fmt"

	"devhub/pkg/crawler"
	"devhub/pkg/source/json"
)

func main() {
	fmt.Println("DevHub")

	sourceLinks := json.Parse()

	for _, sourceLink := range sourceLinks {
		crawler.Run(sourceLink)
	}
}
