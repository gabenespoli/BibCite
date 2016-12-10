//
//  Citation.swift
//  BibCite
//
//  Created by Alex Andrews on 160625.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation
import AppKit


/// A Citation object comprises all the fields of a citation (citekey, author, etc.) and offers various Citation-related utilities such as copy-to-clipboard and initialize-from-string
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
        return "[\(key)] \(author). \(year).\n\(title). \(journal)."
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

        
        /**

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
        
        let author = fieldsDict["author"]!.components(separatedBy: " and ")
        self = Citation(key: fieldsDict["citeKey"]!, author: author)
        */
    }
    
    /**
     Copy Citation's key to the clipboard
     */
    func copyKey(){
        
    }
}
