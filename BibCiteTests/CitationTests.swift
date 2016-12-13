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
    func testThatItIsInitializedFromString(){
        // given
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "String-Single-1", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let citation = Citation(string: testString)!
        
        // then
        XCTAssertEqual(citation.key, "Bidelman2009")
        XCTAssertEqual(citation.author, "Bidelman, Gavin M and Krishnan, Ananthanarayan")
        XCTAssertEqual(citation.year, "2009")
        XCTAssertEqual(citation.title, "Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem")
        XCTAssertEqual(citation.journal, "Journal of Neuroscience")
        XCTAssertEqual(citation.file, ":Users/gmac/Documents/Mendeley/Bidelman, Krishnan/Bidelman, Krishnan - 2009 - Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem.pdf:pdf")
        XCTAssertEqual(citation.url, "http://www.jneurosci.org/cgi/doi/10.1523/JNEUROSCI.3900-09.2009 papers3://publication/doi/10.1523/JNEUROSCI.3900-09.2009")
        XCTAssertEqual(citation.volume, "29")
        XCTAssertEqual(citation.number, "42")
        XCTAssertEqual(citation.pages, "13165--13171")
        XCTAssertNil(citation.doi)
        
    }
    
    func testThatItIsInitializedFromDifferentString(){
        // given
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "String-Single-2", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let citation = Citation(string: testString)!
        
        // then
        XCTAssertEqual(citation.key, "Caramazza1988")
        XCTAssertEqual(citation.author, "Caramazza, Alfonso and McCloskey, Michael")
        XCTAssertEqual(citation.year, "1988")
        XCTAssertEqual(citation.title, "The case for single-patient studies")
        XCTAssertEqual(citation.journal, "Cognitive Neuropsychology")
        XCTAssertEqual(citation.file, ":Users/gmac/Documents/Mendeley/Caramazza, McCloskey/Caramazza, McCloskey - 1988 - The case for single-patient studies.pdf:pdf")
        XCTAssertEqual(citation.url, "http://www.tandfonline.com/doi/abs/10.1080/02643298808253271 papers3://publication/doi/10.1080/02643298808253271")
        XCTAssertEqual(citation.volume, "5")
        XCTAssertEqual(citation.number, "5")
        XCTAssertEqual(citation.pages, "517--527")
        XCTAssertEqual(citation.doi, "hats")
    }
    
    
    // Clipboard tests
    func testThatItIsCopiedToClipboard(){
        // given
//        let citation = Citation(key: "TestKey", authors: ["Gabe","Alex"])
//        
//        // when
//        citation.copyKey()
//        
//        // then
//        let clipboardContents = NSPasteboard.general().string(forType: NSPasteboardTypeString)
//        let expected = citation.key
//        XCTAssertEqual(clipboardContents, expected)
    }
    
}
