//
//  Library.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation


/// The Library struct keeps a record of all known Citation objects and tools for their setup and search
struct Library{
    
    let citations:[Citation]
    private let allCitationFilename = "BibFile-Full"
    
    
    /**
     Loads all Citation objects from file
     */
    init(){
        guard let url = Bundle.main.url(forResource:allCitationFilename, withExtension: "bib") else{
            fatalError("Could not find citation reference file")
        }
        self.citations = CitationLoader.shared.load(fromUrl: url)
    }
    
    
    /**
     Returns Citations that match given search query
     
     - Parameter query: A string comprising the search query
     */
    func search(query: String) -> [Citation]{
        return citations // fake
    }
}
