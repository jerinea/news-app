//
//  PeriodSelectionViewControllerTests.swift
//  NewsAppTests
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import XCTest
@testable import NewsApp

class PeriodSelectionViewControllerTests: XCTestCase, PeriodSelectionViewControllerDelegate {
    
    var sut: PeriodSelectionViewController!
    
    var selectedtedValue = 0

    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        sut = storyboard.instantiateViewController(withIdentifier: "PeriodSelectionViewController") as? PeriodSelectionViewController
        
        sut.delegate = self
                
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
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = "UITableViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func testPeriodSelectionViewControllerDelegate() throws {
        
        sut.delegate?.periodSelected(viewController: sut, value: 2)
        
        let result = try XCTUnwrap(selectedtedValue)
        XCTAssertEqual(result, 2)
    }
    
    func periodSelected(viewController: PeriodSelectionViewController, value: Int) {
        selectedtedValue = value
    }

}
