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
    
    /**
     Loads all Citation objects from file
     */
    init(){
        //    guard let bibFilePath = Bundle.pathForResource("BibFile-Full",
        //                                             ofType: "bib",
        //                                             inDirectory: "Resources") else{
        //        fatalError("Could not find bib file")
        //    } still figuring out how to load from file using a command line tool
        let url = NSURL() // fake
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
