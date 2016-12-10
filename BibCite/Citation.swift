//
//  Citation.swift
//  BibCite
//
//  Created by Alex Andrews on 160625.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation
import AppKit


class Citation:CustomStringConvertible{
    
    var key: String
    var author: String
    var year: String
    var title: String
    var journal: String?
    var file: String?
    var url: String?
    var volume: String?
    var number: String?
    var pages: String?
    var doi: String?
    
    var description: String{
        return "[\(key)] \(author). \(year).\n\(title). \(journal ?? "")."
    }
    
    
    init(key: String, author: String, year: String, title: String, journal: String?, file: String?, url: String?, volume: String?, number: String?, pages: String?, doi: String?){
        self.key = key
        self.author = author
        self.year = year
        self.journal = journal
        self.title = title
        self.file = file
        self.url = url
        self.volume = volume
        self.number = number
        self.pages = pages
        self.doi = doi
    }
    
    /**
     Initializes a Citation object given a string in the .bib format
     
     - Parameter string: The string data from within a .bib file's @article{} tag
     */
    convenience init?(string: String){
        
        var citationSplit = string.components(separatedBy: "\n")
        
        // add field name to citekey, because this isn't explicitly labelled in the bibtex file
        citationSplit[0] = "key = " + citationSplit[0]
        //print(citationSplit)
        
        let citation = citationSplit.map({$0.components(separatedBy: "=")})
            .reduce([String:String]()) { myDict, keyAndValue in
                var output = myDict
                output[keyAndValue[0].trimmingCharacters(in: CharacterSet.whitespaces)] = keyAndValue[1].trimmingCharacters(in: CharacterSet.whitespaces)
                    .trimmingCharacters(in: [",", "{", "}"])
                return output
        }
        
        guard let key = citation["key"],
            let author = citation["author"],
            let year = citation["year"],
            let title = citation["title"] else {
                return nil
        }
        
        self.init(key: key, author: author, year: year, title: title, journal: citation["journal"], file: citation["file"], url: citation["url"], volume: citation["volume"], number: citation["number"], pages: citation["pages"], doi: citation["doi"])

    }
    
    /**
     Copy Citation's key to the clipboard
     */
    func copyKey(){
        
    }
}
