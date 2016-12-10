//
//  main.swift
//  BibCite
//
//  Created by Gabe Nespoli on 2016-06-23.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation

func main(){    
    if CommandLine.argc >= 2{
        let query = CommandLine.arguments[1..<Int(CommandLine.argc)].joined(separator: " ")
        
        let library = Library()
        let results = library.search(query:query)
        
        results.forEach{print($0)}
        
    } else {
        print("ERROR: Single argument expected. You entered \(CommandLine.argc)")
    }
}

main()
