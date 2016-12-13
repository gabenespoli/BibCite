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
    private static let allCitationUrl = URL(fileURLWithPath: "BibFile-Full.bib")
    
    init(citations: [Citation]){
        self.citations = citations
    }
    
    /**
     Loads all Citation objects from file
     */
    convenience init(){
        guard FileManager.default.fileExists(atPath: Library.allCitationUrl.path) else{
            fatalError("Could not find citation reference file at path \(Library.allCitationUrl.path)")
        }
        let citations = CitationLoader.shared.load(fromUrl: Library.allCitationUrl)
        self.init(citations: citations)
    }

    
    /**
     Returns Citations that match given search query
     
     - Parameter query: A string comprising the search query
     */
    func search(query: String) -> [Citation]{
        let results = query
            .components(separatedBy: .whitespaces) // individual search terms
            .map{ self.citations(term: $0) } // results for each search term
            .reduce( Set<Citation>(self.citations) ){ overallResults, termResults in
                var temp = overallResults
                temp.formIntersection(termResults)
                return temp
        } // calculate intersection of all results (i.e., AND everything)
        return Array(results).sorted(by: {$0.year > $1.year})
    }
    
    
    /// Returns Citation objects that match individual search term
    private func citations(term: String) -> Set<Citation>{
        let resultsArray = self.citations.filter{
            if $0.key.contains(term) ||
                $0.author.contains(term) ||
                $0.year.contains(term) ||
                $0.title.contains(term) ||
                $0.journal?.contains(term) ?? false ||
                $0.file?.contains(term) ?? false ||
                $0.url?.contains(term) ?? false ||
                $0.volume?.contains(term) ?? false ||
                $0.number?.contains(term) ?? false ||
                $0.pages?.contains(term) ?? false ||
                $0.doi?.contains(term) ?? false {
                return true
            }
            return false
        }
        return Set<Citation>(resultsArray)
    }
}
