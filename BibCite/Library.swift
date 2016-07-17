//
//  Library.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation

struct Library{
    
    let citations:[Citation]
    private let allCitationFilename = "BibFile-Full"
    
    /**
     Loads all Citation objects from file
     */
    init(){
        guard let url = Bundle.main.urlForResource(allCitationFilename, withExtension: "bib") else{
            fatalError("Could not find citation reference file")
        }
        let loader = CitationLoader()
        self.citations = loader.citations(url: url)
    }
    
    
    /**
     Returns Citations that match given search query
     
     - Parameter query: A string comprising the search query
     */
    func search(query: String) -> [Citation]{
        return citations // fake
    }
}
