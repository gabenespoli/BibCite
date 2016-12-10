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
        Citation(key: "Gabe2011", author: "barry dogman", year: "2011", title: ""),
        Citation(key: "Gabe2017", author: "barry fish", year: "2017", title: ""),
        Citation(key: "Alex2015", author: "horse dogman", year: "1932", title: ""),
        Citation(key: "Alex1788", author: "eddie patch", year: "1932", title: "")]
    
    
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
        XCTAssertEqual(matches[0].key, "Gabe2017")
        XCTAssertEqual(matches[1].key, "Gabe2011")
    }
    
    func testThatItReturnsKnownResultForMultiWordSearch(){
        // given
        let library = Library(citations: testCitations)
        
        // when
        let matches = library.search(query: "horse dogman")
        
        // then
        XCTAssertEqual(matches.count, 1)
        XCTAssertEqual(matches.first!.key, "Alex2015")
    }
}
