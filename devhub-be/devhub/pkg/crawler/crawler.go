// Crawler is a initial implementation of crawler logic.
// It takes Link model and start parsing all realted sub-links
// with distinction of article links.

package crawler

import (
	"log"
	"regexp"

	"github.com/gocolly/colly"
	"github.com/pkg/errors"

	"devhub/pkg/source"
)

// Run executes crawler for the given source link and gets sub-links.
func Run(sourceLink source.Link) {
	collector := colly.NewCollector()

	articleRegexp, err := regexp.Compile(sourceLink.ArticleRegexp)
	if err != nil {
		log.Fatalln(errors.Wrap(err, "Error while compiling regexp"))
	}

	collector.OnHTML("a", func(e *colly.HTMLElement) {
		link := e.Attr("href")

		if articleRegexp.MatchString(link) {
			log.Println("Found article URL", link)
		} else {
			log.Println("Not match", link)
		}
	})

	collector.Visit(sourceLink.SourceURL)
}
