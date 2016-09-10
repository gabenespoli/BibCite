//
//  CitationLoader.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation

class CitationLoader{
    
    
    /**
     Returns an array of Citation objects for a particular BibTeX file
     
     - Parameter url: URL of BibTeX file
     */
    func citations(url: NSURL) -> [Citation]{
        return [makeCitation(string: ""),
                makeCitation(string: ""),
                makeCitation(string: "")] // fake
    }
    
    
    /**
     Returns an array of citation strings from a BibTeX file, e.g., 
        ["Bidelman2009,\nauthor = {…",
        "Caramazza1988,\nauthor = {…",
        …]
     
     - Parameter url: URL of BibTeX file
     */
    func citationStrings(url: NSURL) -> [String]{
        return [String]() // fake
    }
    
    
    /**
     Make a Citation object given a string in the .bib format
     
     - Parameter string: The string data from within a .bib file's @article{} tag
     */
    func makeCitation(string: String) -> Citation{
        
        let citeKey = "Bidelman2009"
        let authorList = ["Bidelman","Gavin M and Krishnan","Ananthanarayan"]
        
        return Citation(key: citeKey, authors: authorList)
    }
    
}
