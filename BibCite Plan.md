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
            - set max number of names to show before adding et al.
            - set option to do "<first author>  et al. (<year>)"
        - full formatted reference (e.g., APA style; could use .csl files here)
    - display user's notes (if there is a notes field in the BibTeX entry)
    - display abstract
    - open pdf

## Classes