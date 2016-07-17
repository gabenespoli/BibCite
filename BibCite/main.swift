//
//  main.swift
//  BibCite
//
//  Created by Gabe Nespoli on 2016-06-23.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import Foundation

if Process.argc == 2{
    let library = Library()
    let query = Process.arguments[1]
    let results = library.search(query:query)
    results.forEach{print($0)} // Replace with $0.summary
} else {
    print("ERROR: Single argument expected. You entered \(Process.argc)")
}

