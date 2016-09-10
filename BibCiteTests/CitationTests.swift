//
//  CitationTests.swift
//  BibCite
//
//  Created by Alex Andrews on 160625.
//  Copyright © 2016 Gabriel A. Nespoli & Alex Andrews. All rights reserved.
//

import XCTest
@testable import BibCite

class CitationTests: XCTestCase {
    
    // -- Initialize-from-string tests --
    func testThatItsKeyIsInitializedFromString(){
        // given
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "String-Single-1", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let citation = Citation(string: testString)
        
        // then
        let expected = "Bidelman2009"
        XCTAssertEqual(citation.key, expected)
    }
    
    func testThatItsKeyIsInitializedFromDifferentString(){
        // given
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "String-Single-2", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let citation = Citation(string: testString)
        
        // then
        let expected = "Caramazza1988"
        XCTAssertEqual(citation.key, expected)
    }
    
    func testThatItsAuthorsAreInitializedFromString(){
        // given
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "String-Single-1", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let citation = Citation(string: testString)
        
        // then
        let expected = ["Bidelman, Gavin M", "Krishnan, Ananthanarayan"]
        XCTAssertEqual(citation.authors, expected)
    }
    
    func testThatItsAuthorsAreInitializedFromDifferentString(){
        // given
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "String-Single-2", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let citation = Citation(string: testString)
        
        // then
        let expected = ["Caramazza, Alfonso", "McCloskey, Michael"]
        XCTAssertEqual(citation.authors, expected)
    }
    
    
    // Clipboard tests
    func testThatItIsCopiedToClipboard(){
        // given
        let citation = Citation(key: "TestKey", authors: ["Gabe","Alex"])
        
        // when
        citation.copyKey()
        
        // then
        let clipboardContents = NSPasteboard.general().string(forType: NSPasteboardTypeString)
        let expected = citation.key
        XCTAssertEqual(clipboardContents, expected)
    }
    
}
