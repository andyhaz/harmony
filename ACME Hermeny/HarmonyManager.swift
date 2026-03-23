//
//  HarmonyManager.swift
//  ACME Hermeny
//
//  Created by andy Hazlett on 3/22/26.
//
import SwiftUI
import Combine // This fixes the 'ObservableObject' and '@Published' errors

class HarmonyManager: ObservableObject {
    @Published var baseColor: Color = .blue
    
    var hexString: String {
        return baseColor.toHex() ?? "#007AFF"
    }
    
    var rgbString: String {
        return baseColor.toRGBString()
    }
}

extension Color {
    // 1. Logic to turn Color into a Hex String
    func toHex() -> String? {
        #if os(iOS)
        let uiColor = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        #else
        let nsColor = NSColor(self).usingColorSpace(.deviceRGB) ?? .black
        let red = nsColor.redComponent
        let green = nsColor.greenComponent
        let blue = nsColor.blueComponent
        #endif
        
        return String(format: "#%02X%02X%02X",
                      Int(red * 255),
                      Int(green * 255),
                      Int(blue * 255))
    }

    // 2. Logic to turn Color into an RGB String
    func toRGBString() -> String {
        #if os(iOS)
        let uiColor = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        #else
        let nsColor = NSColor(self).usingColorSpace(.deviceRGB) ?? .black
        let red = nsColor.redComponent
        let green = nsColor.greenComponent
        let blue = nsColor.blueComponent
        #endif
        
        return "\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255))"
    }

    // 3. Logic to turn a Hex String back into a Color (Fixes the blank screen)
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default: (r, g, b) = (1, 1, 1)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: 1)
    }
}
