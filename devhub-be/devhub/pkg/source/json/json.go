package json

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/pkg/errors"

	"devhub/pkg/source"
)

// Parse is exported.
func Parse() []source.Link {
	fmt.Println("Parser started...")

	file, err := os.Open("assets/initial_sources.json")
	if err != nil {
		log.Fatalln(errors.Wrap(err, "Error while opening file"))
	}
	defer file.Close()

	bytes, err := ioutil.ReadAll(file)
	if err != nil {
		log.Fatalln(errors.Wrap(err, "Error while reading file"))
	}

	var sourceLinks []source.Link
	err = json.Unmarshal(bytes, &sourceLinks)
	if err != nil {
		log.Fatalln(errors.Wrap(err, "Error while parsing JSON"))
	}

	log.Println(sourceLinks)

	return sourceLinks
}
