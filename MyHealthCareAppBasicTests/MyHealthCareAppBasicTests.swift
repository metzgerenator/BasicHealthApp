//
//  MyHealthCareAppBasicTests.swift
//  MyHealthCareAppBasicTests
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import XCTest
@testable import MyHealthCareAppBasic
import Alamofire

class MyHealthCareAppBasicTests: XCTestCase {

    /**
     tests if the api is returning a 200.  A second test could be addded to account for invalid characters.  Right now the AlamoRouter does not parse out the error key.
     */
    func testAPICall() {
        
        let promise = expectation(description: "success api call")
        let query: [String : Any] = [MyHealthSelectionKeys.age.rawValue : 26,
                                                   MyHealthSelectionKeys.sex.rawValue : MyHealthSelectionKeys.male.rawValue ]
        AlamoRouter.alamoRouterRequest(withRoute: .myHealthFinderJson(query)) { (success, responseJson) in
            if success || responseJson == nil {
                promise.fulfill()
            } else {
                XCTFail("api call failed")
            }
        }
        wait(for: [promise], timeout: 10)
    }


}
