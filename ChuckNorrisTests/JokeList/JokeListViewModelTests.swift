import XCTest
@testable import ChuckNorris

class JokeListViewModelTests: XCTestCase {
    
    func testSuccessfulLoading() {
        let mockService = MockJokeService(isSuccessful: true)
        let sut = JokeListViewModel(jokesService: mockService)
        let exp = expectation(description: "fetchCompleted")
        sut.fetchData {
            exp.fulfill()
        } failure: { _ in
            XCTFail("Should not fail")
        }
        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual(sut.numberOfCells, 5)
        let joke3 = sut.joke(at: 2)
        XCTAssertEqual(joke3.id, 513)
        XCTAssertEqual(joke3.content, "Chuck Norris does not code in cycles, he codes in strikes.")
    }
    
    func testFailedLoading() {
        let mockService = MockJokeService(isSuccessful: false)
        let sut = JokeListViewModel(jokesService: mockService)
        let exp = expectation(description: "fetchCompleted")
        var fetchedError: Error?
        sut.fetchData {
            XCTFail("Should not succeed")
        } failure: { error in
            fetchedError = error
            exp.fulfill()
        }
        XCTAssertEqual(fetchedError?.localizedDescription, "Failed to load jokes")
        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual(sut.numberOfCells, 0)
    }
}
