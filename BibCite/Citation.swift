//
//  Citation.swift
//  BibCite
//
//  Created by Alex Andrews on 160625.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation
import AppKit


/// A Citation object comprises all the fields of a citation (citekey, authors, etc.) and offers various Citation-related utilities such as copy-to-clipboard and initialize-from-string
struct Citation{
    
    let key: String
    let authors: [String]
    
    
    init(key: String, authors: [String]){
        self.key = key
        self.authors = authors
    }
    
    /**
     Initializes a Citation object given a string in the .bib format
     
     - Parameter string: The string data from within a .bib file's @article{} tag
     */
    init(string: String){

        // split by newlines
        let fields = string.characters.split(separator: "\n").map{String($0)}
        
        var fieldsDict: [String:String] = [:] // initalize dictionary
        
        // add cite key to dictionary
        fieldsDict["citeKey"] = fields[0].trimmingCharacters(in: .whitespacesAndNewlines)
        fieldsDict["citeKey"] = fieldsDict["citeKey"]?.trimmingCharacters(in: ["}","{",","])
        
        // add rest of info to dictionary
        // start at 1 because citekey is done above because it doesn't have an "=" to split by
        for i in 1...fields.count-1 {
            var fieldsTrimmed = fields[i].trimmingCharacters(in: .whitespacesAndNewlines)
            
            var temp = fieldsTrimmed.characters.split(separator: "=").map{String($0)}
            
            for j in 0...temp.count-1 {
                temp[j] = temp[j].trimmingCharacters(in: .whitespacesAndNewlines)
                temp[j] = temp[j].trimmingCharacters(in: ["}","{",","])
                temp[j] = temp[j].trimmingCharacters(in: .whitespacesAndNewlines)
            }
            
            fieldsDict["\(temp[0])"] = temp[1]
        }
        
        let authors = fieldsDict["author"]!.components(separatedBy: " and ")
        self = Citation(key: fieldsDict["citeKey"]!, authors: authors)
    }
    
    /**
     Copy Citation's key to the clipboard
     */
    func copyKey(){
        
    }
}
