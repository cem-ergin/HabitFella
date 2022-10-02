//
//  HabitFellaTests.swift
//  HabitFellaTests
//
//  Created by Cem Ergin on 14/06/2022.
//

import XCTest
import RealmSwift
@testable import HabitFella

class ViewControllerTest: XCTestCase {
    let realmPath = URL(fileURLWithPath: "...")
    
    func test_rendersNavigationBar () {
        let sut = ViewController()
        _ = sut.view
        XCTAssertTrue(sut.view.subviews.contains(sut.navigationBar))
    }
    
    func test_rendersRightBarButtonItem_InNavigationBar () {
        let sut = ViewController()
        _ = sut.view
        XCTAssertTrue(sut.navigationBar!.items!.first!.rightBarButtonItem != nil)
    }
    
    func test_rendersHomePageTitle_InNavigationBar () {
        let sut = ViewController()
        _ = sut.view
        XCTAssertEqual(sut.navigationBar!.items!.first!.title, "Home Page")
    }
    
    
    func test_rendersTableView () {
        let sut = ViewController()
        _ = sut.view
        XCTAssertTrue(sut.view.subviews.contains(sut.tableView))
    }
    
    func test_withNoneRealmData_tableView_ShouldContainZeroItem () {
        let testRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: UUID().uuidString))
        let sut = ViewController()
        sut.realm = testRealm
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
   
    func test_withOneRealmData_tableView_ShouldContainOneItem () {
        let testRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: UUID().uuidString))
        let sut = ViewController()
        sut.realm = testRealm
        
        let habit = Habit(value: ["name": "habit"])
        
        try! testRealm.write {
            testRealm.add(habit)
        }
        
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
   
    func test_withThreeRealmData_tableView_ShouldContainThreeItem () {
        let testRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: UUID().uuidString))
        let sut = ViewController()
        sut.realm = testRealm
        
        let habitOne = Habit(value: ["name": "habitOne"])
        let habitTwo = Habit(value: ["name": "habitTwo"])
        let habitThree = Habit(value: ["name": "habitThree"])
        
        try! testRealm.write {
            testRealm.add(habitOne)
            testRealm.add(habitTwo)
            testRealm.add(habitThree)
        }
        
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }
    
    func test_withRealmData_tableView_ShouldContainNameOfHabitInCellsTextLabel () {
        let testRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: UUID().uuidString))
        let sut = ViewController()
        sut.realm = testRealm
        
        let habitOne = Habit(value: ["name": "habitOne"])
        
        try! testRealm.write {
            testRealm.add(habitOne)
        }
        
        _ = sut.view
        
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, String("habitOne"))
    }
   
}
