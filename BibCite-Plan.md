# BibCite
A superpower.

## Usage and Functionality
- user must define the location of a BibTeX file
- user types in search terms (e.g., author, year, title, journal, etc.)
- app displays search results
- user chooses a result, and one of the following can happen
    - copy/insert some text
        - citekey (e.g., pandoc format)
        - author last names
        - author last names plus no-author/year-only citekey
            - set max number of names to show before adding "et al.""
            - set option to do "<first author>  et al. (<year>)"
        - full formatted reference (e.g., APA style; could use .csl files here)
    - display user's notes (if there is a notes field in the BibTeX entry)
    - display abstract
    - open pdf

## Overview of model

### Citation
- `Citation` comprises all the fields of a citation—citekey, authors, etc.—and offers various `Citation`-related utilities such as copy-to-clipboard and initialize-from-string.
- Usage: Can be used in any class.

### Library
- A record of all known `Citation` objects and tools for their setup and search.
- Usage: Used as an interface to the model (i.e., responds to search queries, setup commands, etc.) so that rest of app needn't worry about `CitationLoader`.

### CitationLoader
- `CitationLoader` returns an array of `Citation` objects for a particular BibTeX file path. 
- BibTeX file path --> `CitationLoader` --> Citation object array.
- Usage: It is used only by the `Library`.

## Model unit tests
Test that incoming queries yield expected results, incoming commands yield expected changes to exposed object state (i.e., not private stuff), and that outgoing commands are received by target objects.

### Citation
- Test that it copies to clipboard

### CitationLoader
- Test that it loads expected number of `Citation` objects from sample file
- Test that it loads expected string array of citations from sample file
- Test that it initializes a `Citation` instance from a string

### Library
- Test that initialization loads expected expected mock data from the `CitationLoader` class
- Test that it returns nothing for empty search term
- Test that it returns known result for single word search term and sample data
- Test that it returns known result for multiple word search term and sample data


## Model integration tests
- Test that calling `setup()` on `Library` with mock data yields expected Citation array
- Test that calling `search(searchTerm:)` on the `Library` with mock data yields empty results for empty query
- Test that calling `search(searchTerm:)` on the `Library` with mock data yields expected results for single word query
- Test that calling `search(searchTerm:)` on the `Library` with mock data yields expected results for multi-word query
