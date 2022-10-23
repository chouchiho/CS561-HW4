import XCTest
import MyLibrary
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {
    func testIsLuckyBecauseWeAlreadyHaveLuckyNumber() async {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: true,
            shouldReturnTemperatureWithAnEight: false
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)

        // When
        let isLuckyNumber = await myLibrary.isLucky(8)

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == true)
    }

    func testIsLuckyBecauseWeatherHasAnEight() async throws {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: true,
            shouldReturnTemperatureWithAnEight: true
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)

        // When
        let isLuckyNumber = await myLibrary.isLucky(0)

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == true)
    }

    func testIsNotLucky() async {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: true,
            shouldReturnTemperatureWithAnEight: false
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)

        // When
        let isLuckyNumber = await myLibrary.isLucky(7)

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == false)
    }

    func testIsNotLuckyBecauseServiceCallFails() async {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: false,
            shouldReturnTemperatureWithAnEight: false
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)

        // When
        let isLuckyNumber = await myLibrary.isLucky(7)

        // Then
        XCTAssertNil(isLuckyNumber)
    }
    
    func testWeatherCorrect() throws{
        //Given

        //Weather data in data.json
           let jsonString = """
    {"coord":{"lon":-123.262,"lat":44.5646},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":61,"feels_like":60.19,"temp_min":60.85,"temp_max":72.45,"pressure":1015,"humidity":72},"visibility":10000,"wind":{"speed":9.22,"deg":310},"clouds":{"all":0},"dt":1665945585,"sys":{"type":1,"id":3727,"country":"US","sunrise":1665930569,"sunset":1665970039},"timezone":-25200,"id":5720727,"name":"Corvallis","cod":200}
    """
           

            let jsonData = Data(jsonString.utf8)
            let jsonDecoder = JSONDecoder()
        //When
        //Get the temperature
            let weather = try jsonDecoder.decode(Weather.self, from: jsonData)

        //Then
        //Check the temprature is equal to temp in data.json.
        XCTAssertEqual(weather.main.temp, 61.0)

    }

}
