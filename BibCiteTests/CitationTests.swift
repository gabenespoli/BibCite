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
