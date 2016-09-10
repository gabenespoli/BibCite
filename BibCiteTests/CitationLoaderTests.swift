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
        let url = NSURL() // Replace with BibFile-Small
        
        // when
        let loader = CitationLoader()
        let citations = loader.citations(url: url)
        
        // then
        let expected = 3
        XCTAssertEqual(citations.count,expected)
    }
    
    func testThatItLoadsExpectedStringArrayOfCitations(){
        
    }

    
    // -- makeCitation tests --
    func testThatItsKeyIsInitializedFromString(){
        // given
        let bundle = Bundle(for: self.dynamicType)
        let path = bundle.pathForResource("String-Single-1", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let loader = CitationLoader()
        let citation = loader.makeCitation(string: testString)
        
        // then
        let expected = "Bidelman2009"
        XCTAssertEqual(citation.key, expected)
    }
    
    func testThatItsKeyIsInitializedFromDifferentString(){
        // given
        let bundle = Bundle(for: self.dynamicType)
        let path = bundle.pathForResource("String-Single-2", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let loader = CitationLoader()
        let citation = loader.makeCitation(string: testString)
        
        // then
        let expected = "Caramazza1988"
        XCTAssertEqual(citation.key, expected)
    }
    
    func testThatItsAuthorsAreInitializedFromString(){
        // given
        let bundle = Bundle(for: self.dynamicType)
        let path = bundle.pathForResource("String-Single-1", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let loader = CitationLoader()
        let citation = loader.makeCitation(string: testString)
        
        // then
        let expected = ["Bidelman","Gavin M and Krishnan","Ananthanarayan"]
        XCTAssertEqual(citation.authors, expected)
    }
    
    func testThatItsAuthorsAreInitializedFromDifferentString(){
        // given
        let bundle = Bundle(for: self.dynamicType)
        let path = bundle.pathForResource("String-Single-2", ofType: "bib")!
        let testString = try! String(contentsOfFile: path)
        
        // when
        let loader = CitationLoader()
        let citation = loader.makeCitation(string: testString)
        
        // then
        let expected = ["Caramazza","Alfonso and McCloskey"," Michael"]
        XCTAssertEqual(citation.authors, expected)
    }
}
