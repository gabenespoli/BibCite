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
- Citation is a simple struct comprising all the fields of a citation—citekey, authors, etc.—with its association actions (e.g., copy to clipboard)

### FileLoader
- FileLoader returns an array of Citation structs for a particular BibTeX file path. It is known only to the Library.
- BibTeX file path --> *FileLoader* --> Citation object array

### Library
- A record of all known Citation objects and associated tasks required by the ViewModel

### Searcher
- The Searcher class returns an ordered list of all known Citation objects that match a particular search term. It is known only to the library.
- Search term --> *Searcher* --> Array of matching Citation objects

## Model unit tests
Test that incoming queries yield expected results, incoming commands yield expected changes to exposed object state (i.e., not private stuff), and that outgoing commands are received by target objects.

### Citation
- Test that it copies to clipboard

### FileLoader
- Test that it loads known Citation object array from sample file

### Library
- Test that a search query in turn queries the Searcher class
- Test that a setup query in turn queries the FileLoader class

### Searcher
- Test that it returns nothing for empty search term
- Test that it returns known result for single word search term and sample data
- Test that it returns known result for multiple word search term and sample data

## Model integration tests
- Test that calling setup() on the Library function yields expected Citation array
- Test that calling search(searchTerm:) on the Library function yields empty results for empty query
- Test that calling search(searchTerm:) on the Library function yields expected results for single word query
- Test that calling search(searchTerm:) on the Library function yields expected results for multi-word query
