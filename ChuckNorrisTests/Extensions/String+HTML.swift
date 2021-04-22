import XCTest
@testable import ChuckNorris

class String_HTML: XCTestCase {
    func testEscapedString() {
        let string = "String with quotes &quot; and ampersands &amp; and apostrophes &apos;"
        XCTAssertEqual(string.escapedHTML, "String with quotes \" and ampersands & and apostrophes '")
    }
    
    func testEmptyString() {
        let string = ""
        XCTAssertEqual(string.escapedHTML, "")
    }
}
