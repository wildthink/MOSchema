import XCTest
@testable import MOSchema

final class MOSchemaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MOSchema().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
