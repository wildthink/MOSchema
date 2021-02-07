//
//  File.swift
//  
//
//  Created by Jason Jobe on 2/7/21.
//

import MOSchema

public extension NSManagedObjectModel {
    
    convenience init (model: String) throws {
        let file_name = try NSManagedObjectModel.modelFileName(name: model)
        let url = URL(fileURLWithPath: file_name)
        try self.init (sourceURL: url)
    }
    
    static func modelFileName(name: String) throws -> String {
        let fm = FileManager()
        if fm.isReadableFile(atPath: name) { return name }
        if fm.isReadableFile(atPath: "\(name).xcdatamodel") { return "\(name).xcdatamodel" }
        if fm.isReadableFile(atPath: "\(name).xcdatamodeld") { return "\(name).xcdatamodeld" }
        throw "Unable to find \(name).xcdatamodel(d)"
    }
}

extension String: Error {
}


public extension NSAttributeType {
    var sql_type: String {
        switch self {
            case .integer16AttributeType,
                 .integer32AttributeType,
                 .integer64AttributeType:
                return "INTEGER"
            case .floatAttributeType,
                 .doubleAttributeType:
                return "REAL"
            case .binaryDataAttributeType:
                return "BLOB"
            case .stringAttributeType:
                return "TEXT"
            case .dateAttributeType:
                return "TEXT DATE"
            default:
                return ""
        }
    }
}

public extension NSAttributeDescription {
    @objc func sql_create() -> String {
        "\(name) \(attributeType.sql_type)"
    }
}

public extension NSDerivedAttributeDescription {
    @objc override func sql_create() -> String {
        guard let dexp = derivationExpression
        else { return name }
        
        return
            "\(name) \(attributeType.sql_type) GENERATED AS (\(dexp.sql)) VIRTUAL"
    }
}

public extension NSExpression {
    var sql: String {
        self.description
    }
}
