import XCTest
@testable import ChuckNorris

class PathTests: XCTestCase {

    func testURLBuilder() {
        let url = URLBuilder.build(limit: 100, excludedCategories: ["a", "b", "c", "d"])
        XCTAssertEqual(url, URL(string: "http://api.icndb.com/jokes/random/100?exclude=%5Ba,b,c,d%5D"))
    }
}
