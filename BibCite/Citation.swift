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
        
        var str = "Bidelman2009,\nauthor = {Bidelman, Gavin M and Krishnan, Ananthanarayan},\nfile = {:Users/gmac/Documents/Mendeley/Bidelman, Krishnan/Bidelman, Krishnan - 2009 - Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem.pdf:pdf},\njournal = {Journal of Neuroscience},\nmonth = {oct},\nnumber = {42},\npages = {13165--13171},\ntitle = {{Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem}},\nurl = {http://www.jneurosci.org/cgi/doi/10.1523/JNEUROSCI.3900-09.2009 papers3://publication/doi/10.1523/JNEUROSCI.3900-09.2009},\nvolume = {29},\nyear = {2009}"

        // split by newlines
        let fields = str.characters.split(separator: "\n").map{String($0)}
        
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

        
        return Citation(key: fieldsDict["citeKey"]!, authors: fieldsDict["author"]!)
    }
    
    /**
     Copy Citation's key to the clipboard
     */
    func copyKey(){
        
    }
}
