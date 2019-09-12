package source

// Link is type to keep information about source link.
type Link struct {
	SourceURL     string `json:"source_url"`
	ArticleRegexp string `json:"article_regexp"`
}

// Parser provides parsing from different sources like
// JSON or Database.
type Parser interface {
	// Parse source for Link entities.
	Parse() []Link
}
