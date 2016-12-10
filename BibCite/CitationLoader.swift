//
//  CitationLoader.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation


/// `CitationLoader` returns an array of `Citation` objects for a particular BibTeX file path.
class CitationLoader{
    
    static let shared = CitationLoader()
    
    /**
     Returns an array of Citation objects for a particular BibTeX file
     
     - Parameter url: URL of BibTeX file
     */
    func load(fromUrl url: URL) -> [Citation]{
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
    private func citationStrings(url: URL) -> [String]{
        
        // Load string from file
        
        // Parse, extracting citations
        
        //NT write test for this
        
        return [String]() // fake
    }
    
    
    /**
     Make a Citation object given a string in the .bib format
     
     - Parameter string: The string data from within a .bib file's @article{} tag
     */
    private func makeCitation(string: String) -> Citation{
        
        let citeKey = "Bidelman2009"
        let authorList = ["Bidelman","Gavin M and Krishnan","Ananthanarayan"]
        
        return Citation(key: citeKey, authors: authorList)
    } // This is probably redundant
    
}
