//
//  Library.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation


/// The Library struct keeps a record of all known Citation objects and tools for their setup and search
class Library{
    
    let citations:[Citation]
    private static let allCitationFilename = "BibFile-Full"
    

    init(citations: [Citation]){
        self.citations = citations
    }
    
    /**
     Loads all Citation objects from file
     */
    convenience init(){
        guard let url = Bundle.main.url(forResource:Library.allCitationFilename, withExtension: "bib") else{
            fatalError("Could not find citation reference file")
        }
        let citations = CitationLoader.shared.load(fromUrl: url)
        self.init(citations: citations)
    }

    
    /**
     Returns Citations that match given search query
     
     - Parameter query: A string comprising the search query
     */
    func search(query: String) -> [Citation]{
        let searchTerms = query.components(separatedBy: .whitespaces)
        let results = searchTerms.reduce( [Citation]() ){ results, term in
            var array = results
            array.append(contentsOf: self.citations(term: term))
            return array
        }
        return results
    }
    
    
    /// Returns Citation objects that match individual search term
    private func citations(term: String) -> [Citation]{
        return self.citations.filter{
            if $0.key.contains(term) || $0.authors.contains(term){
                return true
            }
            return false
        }
    }
}
