//
//  FileLoaderTests.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import XCTest
@testable import BibCite

class CitationLoaderTests: XCTestCase {

    func testThatItLoadsCorrectNumberOfCitations() {
        // given
        let url = Bundle(for: type(of: self)).url(forResource: "BibFile-Small", withExtension: "bib")!
        
        // when
        let loader = CitationLoader()
        let citations = loader.load(fromUrl: url)
        
        // then
        let expected = 3
        XCTAssertEqual(citations.count,expected)
    }
    
    func testThatItLoadsExpectedStringArrayOfCitations(){
        
    }
}
