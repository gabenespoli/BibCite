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
        let strings = citationStrings(url: url)
        return strings.map{ Citation(string: $0) }
    }
    
    
    /**
     Returns an array of citation strings from a BibTeX file, e.g., 
        ["Bidelman2009,\nauthor = {…",
        "Caramazza1988,\nauthor = {…",
        …]
     
     - Parameter url: URL of BibTeX file
     - Note: The number of citationStrings may exceed the number of actual citations, depending on file formatting. Just ensure that flatMap is used when converting these to Citation instances.
     */
    func citationStrings(url: URL) -> [String]{
        
        // Load string from file
        let fileString:String
        do{
            fileString = try String(contentsOf: url)
        }catch let e as NSError{
            print("ERROR: \(e.localizedDescription)")
            return [String]()
        }
        
        // Parse, extracting citations
        let allStrings = fileString
            .components(separatedBy: "@article")
            .dropFirst()
            .filter{$0.characters.count > 0 }
            .map{chunk in
                return chunk
                    .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    .trimmingCharacters(in: CharacterSet(charactersIn: "{}"))
                    .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        return allStrings
    }
}
