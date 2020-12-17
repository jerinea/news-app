//
//  testNewsListViewController.swift
//  NewsAppTests
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import XCTest
@testable import NewsApp

class NewsListViewControllerTests: XCTestCase {

    var sut: NewsListViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        sut = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as? NewsListViewController
                
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasATableView() throws {
        
        let tableView: UITableView = sut.tableView
        XCTAssertNotNil(tableView, "View Controller does not have UITableView property")
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate, "Tableview delegate is not set")
    }
    
    func testTableViewHasDatasource() {
        XCTAssertNotNil(sut.tableView.dataSource, "Tableview datasource is not set")
    }
        
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? NewsListCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "NewsListCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
}
