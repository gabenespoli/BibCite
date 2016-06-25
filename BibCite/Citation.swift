//
//  Citation.swift
//  BibCite
//
//  Created by Alex Andrews on 160625.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation

struct Citation{
    
    let citeKey: String
    let authors: [String]
    
    /**
     Make a Citation object given a string in the .bib format
     
     - Parameter string: The string data from within a .bib file's @article{} tag
     */
    static func make(string: String) -> Citation{
        
        let key = string
        let authorList = ["Fraggle","Doozer","Gorg"]
        
        return Citation(citeKey: key, authors: authorList)
    }
}
