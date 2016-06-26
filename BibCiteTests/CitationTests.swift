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

    func testThatItIsInitializedFromString(){
        // given
        let bundle = Bundle(for: self.dynamicType)
        let path = bundle.pathForResource("String-Single", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when 
        let citation = Citation.make(string: testString)
        
        // then
        let expected = Citation(key:"Bidelman2009",
                                authors: ["Bidelman","Gavin M and Krishnan","Ananthanarayan"])
        XCTAssertEqual(citation.key, expected.key)
        XCTAssertEqual(citation.authors, expected.authors)
    }
    
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
