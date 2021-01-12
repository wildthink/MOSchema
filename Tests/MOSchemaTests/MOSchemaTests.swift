import XCTest
@testable import MOSchema
import MOSchema

final class MOSchemaTests: XCTestCase {
    func testCompileModel() throws {
        var url = URL(fileURLWithPath: #file)
        url = url.deletingLastPathComponent()
            .appendingPathComponent("Model.xcdatamodeld")
        let mom = try NSManagedObjectModel.compileModel(atPath: url.path, inDirectory: NSTemporaryDirectory())

//        print (mom)
        XCTAssertNotNil(mom)

    }

    func testModel() throws {
        var url = URL(fileURLWithPath: #file)
        url = url.deletingLastPathComponent()
            .appendingPathComponent("Model.xcdatamodeld/Model.xcdatamodel")
        let mom = try NSManagedObjectModel(sourceURL: url)
        XCTAssertNotNil(mom)
    }
    
    func testModeld() throws {
        var url = URL(fileURLWithPath: #file)
        url = url.deletingLastPathComponent()
            .appendingPathComponent("Model.xcdatamodeld")
        let mom = try NSManagedObjectModel(sourceURL: url)
        XCTAssertNotNil(mom)
    }

    static var allTests = [
        ("testCompileModel", testCompileModel),
        ("testModel", testModel),
        ("testModeld", testModeld),
    ]
}
