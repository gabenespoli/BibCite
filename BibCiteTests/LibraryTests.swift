//
//  LibraryTests.swift
//  BibCite
//
//  Created by Alex Andrews on 160717.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import XCTest
@testable import BibCite

class LibraryTests: XCTestCase {
    
    let testCitations:[Citation] = [
        Citation(key: "Gabe2011", authors: ["barry","dogman"]),
        Citation(key: "Gabe2017", authors: ["barry","fish"]),
        Citation(key: "Alex2015", authors: ["horse","dogman"]),
        Citation(key: "Alex1788", authors: ["eddie","patch"])]
    
    
    func testThatItReturnsNothingForEmptySearch(){
        // given
        
        let library = Library(citations: testCitations)
        
        // when
        let matches = library.search(query: "Batman")
        
        // then
        XCTAssertEqual(matches.count, 0)
    }
    
    func testThatItReturnsKnownResultForSingleWordSearch(){
        // given
        let library = Library(citations: testCitations)
        
        // when
        let matches = library.search(query: "Gabe")
        
        // then
        XCTAssertEqual(matches.count, 2)
        XCTAssertEqual(matches[0].key, "Gabe2011")
        XCTAssertEqual(matches[1].key, "Gabe2017")
    }
    
    func testThatItReturnsKnownResultForMultiWordSearch(){
        // given
        let library = Library(citations: testCitations)
        
        // when
        let matches = library.search(query: "patch")
        
        // then
        XCTAssertEqual(matches.count, 1)
        XCTAssertEqual(matches.first!.key, "Alex1788")
    }
}
