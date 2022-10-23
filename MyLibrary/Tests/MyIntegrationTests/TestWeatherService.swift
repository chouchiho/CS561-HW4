//
//  File.swift
//  
//
//  Created by 周豈禾 on 10/16/22.
//

import Foundation
import Foundation
import XCTest
import MyLibrary
@testable import MyLibrary

final class TestWeatherService: XCTestCase{
    
    func testGetTemperature() async throws{
        //Given
        //Create a weather service
        let weatherService = WeatherServiceImpl()
        
        //When
        //Get the tempture
        let temp = try await weatherService.getTemperature()
        
        //Then
        //Check the temprature is what you expect
        XCTAssertEqual(temp, 293)
    }
}
