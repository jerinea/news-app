//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewsService() throws {
        
        let promise = expectation(description: "News items in result")
        
        NewsService.shared.getNews(period: 7) { (result) in
            switch result{
            case let .success(newsList):
                XCTAssertTrue(newsList.count > 0)
                promise.fulfill()
            case let .failure(error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        wait(for: [promise], timeout: 30)
    }
    
    func testAPIError() throws {
        let error1 = APIError.noResponse
        XCTAssertEqual(error1.localizedDescription, "No response from api")
        
        let error2 = APIError.noResults
        XCTAssertEqual(error2.localizedDescription, "No results from api")
        
    }
    
    func testEnvironment() throws {
        let apiKey = Environment.apiKey
        XCTAssertNotNil(apiKey)
        
        let apiBase = Environment.apiBase
        XCTAssertNotNil(apiBase)
    }
    
    func testAPIClient() throws {
        let getNews = GetNews(section: "all-sections", period: 1)
        APIClient.shared.perform(getNews) { (result) in
            
        }
        APIClient.shared.cancel(getNews)
    }

}
