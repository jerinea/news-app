//
//  ImageCacheTests.swift
//  NewsAppTests
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import XCTest
@testable import NewsApp

class ImageCacheTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImageCache() throws {
        
        let promise = expectation(description: "News items in result")
        
        let url = "https://static01.nyt.com/images/2020/12/16/science/16VIRUS-PFIZER/16VIRUS-PFIZER-mediumThreeByTwo440.jpg"
        ImageCache.instance.getImage(url, size: CGSize(width: 300, height: 300), cacheType: ImageCacheType.memoryCache) { (image) in
            XCTAssertTrue(image != nil)
            promise.fulfill()
        }
        wait(for: [promise], timeout: 30)
    }
    
    func testImageCacheFileSystem() throws {
        
        let promise = expectation(description: "News items in result")
        
        let url = "https://static01.nyt.com/images/2020/12/16/science/16VIRUS-PFIZER/16VIRUS-PFIZER-mediumThreeByTwo440.jpg"
        ImageCache.instance.getImage(url, size: CGSize(width: 300, height: 300), cacheType: ImageCacheType.fileSystemCache) { (image) in
            XCTAssertTrue(image != nil)
            promise.fulfill()
        }
        wait(for: [promise], timeout: 30)
    }
    
    func testClearCache() throws {
        ImageCache.instance.clearCaheIfCacheIsOld()
    }

}
