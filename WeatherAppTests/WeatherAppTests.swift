//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Vinoth Priyan on 18/10/22.
//

import XCTest
@testable import WeatherApp

final class WeatherAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Weather_resposedata_contains_empty(){
        
        let viewModel = WeatherDataViewModel()
        
        viewModel.fetchedRecords(searchLocation: "")
        
        XCTAssertNil(viewModel.responseweatherData)
    }
    
    func test_Weather_resposedata_contains_notEmpty(){
        
        let viewModel = WeatherDataViewModel()
        
        viewModel.fetchedRecords(searchLocation: "Chennai")
        
        XCTAssertTrue(viewModel.responseweatherData?.location == nil)
    }

}
