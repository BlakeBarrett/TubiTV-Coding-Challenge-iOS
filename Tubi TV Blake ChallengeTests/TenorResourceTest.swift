//
//  TenorResourceTest.swift
//  Tubi TV Blake ChallengeTests
//
//  Created by Blake Barrett on 2/17/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import XCTest

class TenorResourceTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJSONParsing() {
        let resource = TenorResource(from: JSON())
        XCTAssertNotNil(resource)
    }
    
    func testDimensionParsing() {
        let width = 1920
        let height = 1080
        let json: JSON = [
            "dims": [width, height],
        ]
        let resource = TenorResource(from: json)
        XCTAssertEqual(width, resource.width)
        XCTAssertEqual(height, resource.height)
    }
}
