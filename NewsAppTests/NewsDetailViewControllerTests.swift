//
//  NewsDetailViewControllerTests.swift
//  NewsAppTests
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import XCTest
@testable import NewsApp

class NewsDetailViewControllerTests: XCTestCase {
    
    var sut: NewsDetailViewController!
    
    var newsMock = News(title: "Mock Title", byline: "Mock By line", section: "Mock Section", published_date: nil, abstract: nil, media: nil)

    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        sut = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController
        sut.news = newsMock
                
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testUI() {
        XCTAssertEqual(sut.headLineLabel.text, newsMock.title)
        XCTAssertEqual(sut.abstractLabel.text, newsMock.abstract)
        XCTAssertEqual(sut.byLineLabel.text, newsMock.byline)
        XCTAssertEqual(sut.sectionLabel.text, newsMock.section)
        XCTAssertEqual(sut.dateLabel.text, newsMock.published_date)
    }

}
