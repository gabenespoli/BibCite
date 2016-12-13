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

    func testThatItLoadsOneCitationCount() {
        // given
        let url = Bundle(for: type(of: self)).url(forResource: "BibFile-Single", withExtension: "bib")!
        
        // when
        let loader = CitationLoader()
        let citations = loader.load(fromUrl: url)
        
        // then
        let expected = 1
        XCTAssertEqual(citations.count,expected)
    }
    
    func testThatItLoadsThreeCitationsCount() {
        // given
        let url = Bundle(for: type(of: self)).url(forResource: "BibFile-Small", withExtension: "bib")!
        
        // when
        let loader = CitationLoader()
        let citations = loader.load(fromUrl: url)
        
        // then
        let expected = 3
        XCTAssertEqual(citations.count,expected)
    }
    
    func testThatItSendsCorrectStringsToCitation() {
        // given
        let url = Bundle(for: type(of: self)).url(forResource: "BibFile-Small", withExtension: "bib")!
        
        // when
        let loader = CitationLoader()
        let loadedStrings = loader.citationStrings(url: url)
        
        // then
        let expected = "Bidelman2009,\nauthor = {Bidelman, Gavin M and Krishnan, Ananthanarayan},\nfile = {:Users/gmac/Documents/Mendeley/Bidelman, Krishnan/Bidelman, Krishnan - 2009 - Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem.pdf:pdf},\njournal = {Journal of Neuroscience},\nmonth = {oct},\nnumber = {42},\npages = {13165--13171},\ntitle = {{Neural Correlates of Consonance, Dissonance, and the Hierarchy of Musical Pitch in the Human Brainstem}},\nurl = {http://www.jneurosci.org/cgi/doi/10.1523/JNEUROSCI.3900-09.2009 papers3://publication/doi/10.1523/JNEUROSCI.3900-09.2009},\nvolume = {29},\nyear = {2009}";
        XCTAssertEqual(loadedStrings.first!, expected)
        XCTAssertNotEqual(loadedStrings.last!, expected)
    }
}
