//
//  CSSFile.swift
//  ACME Hermeny
//
//  Created by andy Hazlett on 3/22/26.
//


// We need this small wrapper to tell SwiftUI what kind of file we are saving
import SwiftUI // Add this line to fix the scope errors
import UniformTypeIdentifiers

struct CSSFile: FileDocument {
    static var readableContentTypes = [UTType.content]
    var text: String

    init(text: String) {
        self.text = text
    }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            text = ""
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: Data(text.utf8))
    }
}

extension HarmonyManager {
    var cssContent: String {
        return """
        /* ACME Harmony Generated CSS */
        :root {
            --base-color: \(hexString);
            --base-rgb: \(rgbString);
        }
        
        .harmony-bg { background-color: \(hexString); }
        .harmony-text { color: \(hexString); }
        """
    }
}
