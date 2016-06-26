//
//  Citation.swift
//  BibCite
//
//  Created by Alex Andrews on 160625.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation
import AppKit

struct Citation{
    
    let key: String
    let authors: [String]
    
    /**
     Make a Citation object given a string in the .bib format
     
     - Parameter string: The string data from within a .bib file's @article{} tag
     */
    static func make(string: String) -> Citation{
        
        let citeKey = string
        let authorList = ["Fraggle","Doozer","Gorg"]
        
        return Citation(key: citeKey, authors: authorList)
    }
    
    /**
     Copy Citation's key to the clipboard
     */
    func copyKey(){
        
    }
}
