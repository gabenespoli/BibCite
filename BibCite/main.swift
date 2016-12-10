//
//  main.swift
//  BibCite
//
//  Created by Gabe Nespoli on 2016-06-23.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation

func main(){
    
    let citationString = "Bidelman2009,\nauthor = {Bidelman, Gavin M and Krishnan, Ananthanarayan},\nfile = {:Users/gmac/Documents/Mendeley/Bidelman, Krishnan/Bidelman, Krishnan - 2009 - Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem.pdf:pdf},\njournal = {Journal of Neuroscience},\nmonth = {oct},\nnumber = {42},\npages = {13165--13171},\ntitle = {{Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem}},\nurl = {http://www.jneurosci.org/cgi/doi/10.1523/JNEUROSCI.3900-09.2009 papers3://publication/doi/10.1523/JNEUROSCI.3900-09.2009},\nvolume = {29},\nyear = {2009}"
    let citation = Citation(string: citationString)
    print(citation)
    
//    if CommandLine.argc == 2{
//        let query = CommandLine.arguments[1]
//        
//        let library = Library()
//        let results = library.search(query:query)
//        
//        results.forEach{print($0)}
//        
//    } else {
//        print("ERROR: Single argument expected. You entered \(CommandLine.argc)")
//    }
}

main()
