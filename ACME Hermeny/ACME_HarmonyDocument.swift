//
//  ACME_HarmonyDocument.swift
//  ACME Harmony
//
//  Created by andy Hazlett on 3/21/26.
//
import SwiftUI
import UniformTypeIdentifiers

struct ACME_HarmonyDocument: FileDocument, Codable {
    var hexColor: String = "#007AFF"
    var lastModified: Date = Date() // Track when you last saved

    init(initialColor: String = "#007AFF") {
        self.hexColor = initialColor
    }

    // Use your custom .ahm type
    static var readableContentTypes: [UTType] { [.harmonyModel, .json] }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            self = try JSONDecoder().decode(ACME_HarmonyDocument.self, from: data)
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // Update the date right before saving
        var savedCopy = self
        savedCopy.lastModified = Date()
        
        let data = try JSONEncoder().encode(savedCopy)
        return .init(regularFileWithContents: data)
    }
}
// Define your custom extension
extension UTType {
    static var harmonyModel: UTType {
        UTType(importedAs: "com.acme.harmony.ahm")
    }
}
