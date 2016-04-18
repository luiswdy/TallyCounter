//
//  TallyCounterTests.swift
//  TallyCounterTests
//
//  Created by Luis Wu on 3/24/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import XCTest
@testable import TallyCounter

class TallyCounterTests: XCTestCase {
    let viewModel: MainViewModel = MainViewModel()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        UserDefaultHelper.clearSettings()
        viewModel.reset()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    // My TDD cases starts here
    
    func testAdd() {
        viewModel.add()
        XCTAssert(viewModel.state.count == 1)
    }
    
    func testReset() {
        viewModel.add(IncrementType.PreviousTrack)
        XCTAssert(viewModel.state.count == IncrementType.PreviousTrack.rawValue)
        viewModel.reset()
        XCTAssert(viewModel.state.count == 0)
    }
    
//    func testSaveState() {
//        
//    }
    
    func testNilSettings() {
        XCTAssertNil(UserDefaultHelper.loadSettings())
    }
}
