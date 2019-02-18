//
//  TenorResponseTest.swift
//  Tubi TV Blake ChallengeTests
//
//  Created by Blake Barrett on 2/17/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import XCTest

class TenorResponseTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDimensionParsing() {
        let width = 1920
        let height = 1080
        let json: JSON = [
            "url": "",
            "preview": "",
            "dims": [width, height],
        ]
        let resource = TenorResource(from: json)
        XCTAssertEqual(resource.width, width)
        XCTAssertEqual(resource.height, height)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
