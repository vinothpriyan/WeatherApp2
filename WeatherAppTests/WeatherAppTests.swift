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

    func test_Weather_resposedata_contains_location_empty(){
        
        let viewModel = WeatherDataViewModel()
        
        /// When search location was empty, the result was expected parameters should be empty
        /// But in this case i have default value in called function. So it's return value using the default location
        
        viewModel.fetchedRecords(searchLocation: "")
        
        XCTAssertTrue(viewModel.responseweatherData?.location == nil)
       
    }
    
    func test_Weather_resposedata_contains_location_not_empty(){
        
        let viewModel = WeatherDataViewModel()
        
        ///When search location was not empty, the result was expected parameters should have value
        viewModel.fetchedRecords(searchLocation: "")
        
        XCTAssertTrue(viewModel.responseweatherData?.location.country.isEmpty == true )
        XCTAssertTrue(viewModel.responseweatherData?.location.name != "")
        XCTAssertTrue(viewModel.responseweatherData?.location.localtime != "")
        XCTAssertTrue(viewModel.responseweatherData?.location.region != "")
        XCTAssertTrue(viewModel.responseweatherData?.location.localtime_epoch.ISO8601Format() != "")
        
    }
    
    func test_Weather_response_current_data_not_empty(){
        
        let viewModel = WeatherDataViewModel()
        
        ///When search location was not empty, the result was expected parameters should have value
        viewModel.fetchedRecords(searchLocation: "")
        
        XCTAssertTrue(viewModel.responseweatherData?.current.condition.icon != "" )
        XCTAssertTrue(viewModel.responseweatherData?.current.feelslike_f != 0)
        XCTAssertTrue(viewModel.responseweatherData?.current.feelslike_c != 0)
        XCTAssertTrue(viewModel.responseweatherData?.current.humidity != 0)
        
    }
    
    func test_Weather_response_forcast_and_forcatDay_data_not_empty(){
        
        let viewModel = WeatherDataViewModel()
        
        ///When search location was not empty, the result was expected parameters should have value
        viewModel.fetchedRecords(searchLocation: "")
        
        
    }

    func test_Weather_response_forcast_and_hourly_data_not_empty(){
    
        
    }
    
    
    
}
