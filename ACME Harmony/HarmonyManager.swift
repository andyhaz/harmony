//
//  HarmonyManager.swift
//  ACME Harmony
//
//  Created by andy Hazlett on 3/21/26.
//
import SwiftUI
import Combine

class HarmonyManager: ObservableObject {
    @Published var baseColor: Color = .blue
    
    var hexString: String {
        let nscolor = NSColor(baseColor).usingColorSpace(.sRGB)
        let r = Int((nscolor?.redComponent ?? 0) * 255)
        let g = Int((nscolor?.greenComponent ?? 0) * 255)
        let b = Int((nscolor?.blueComponent ?? 0) * 255)
        return String(format: "#%02X%02X%02X", r, g, b)
    }
    
    var rgbString: String {
        let nscolor = NSColor(baseColor).usingColorSpace(.deviceRGB) ?? .black
        return "\(Int(nscolor.redComponent * 255)), \(Int(nscolor.greenComponent * 255)), \(Int(nscolor.blueComponent * 255))"
    }
}

extension Color {
    static let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
    static let cyan = Color(red: 0.0, green: 1.0, blue: 1.0)
}
