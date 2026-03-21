//
//  HarmonyColorPicker.swift
//  ACME Harmony
//
//  Created by andy Hazlett on 3/21/26.
//
import SwiftUI
import AppKit

struct HarmonyColorPicker: View {
    @Binding var selection: Color
    @State private var hue: Double = 0
    // Track the pixel position of the selection within the square
    @State private var selectionPoint: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 15) {
            // 1. Saturation & Brightness Square
            GeometryReader { proxy in
                ZStack(alignment: .topLeading) {
                    // COLOR LAYERS
                    Color(hue: hue, saturation: 1, brightness: 1)
                    LinearGradient(gradient: Gradient(colors: [.white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
                    
                    // THE NEW INTERACTIVE CIRCLE INDICATOR
                    Circle()
                        .stroke(isColorDark(selection) ? Color.white : Color.black, lineWidth: 2)
                        .frame(width: 14, height: 14)
                        .position(selectionPoint)
                        // Allow the gesture to pass through to the square below
                        .allowsHitTesting(false)
                }
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged { value in
                        updateSB(value: value, size: proxy.size)
                    }
                )
            }
            .frame(height: 160)
            
            // 2. Hue Slider (Rainbow kapsule)
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .yellow, .green, .cyan, .blue, .magenta, .red]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .clipShape(Capsule())
                    
                    // Hue Indicator (Slider Knob)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 16, height: 16)
                        .overlay(Circle().stroke(Color.black.opacity(0.1), lineWidth: 1))
                        .shadow(radius: 1)
                        .position(x: CGFloat(hue) * proxy.size.width, y: proxy.size.height / 2)
                }
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged { value in
                        hue = Double(max(0, min(value.location.x / proxy.size.width, 1.0)))
                        syncColorFromHue()
                    }
                )
            }
            .frame(height: 12)
        }
        .onAppear {
            initializeValues()
        }
    }
    
    // Updates Saturation/Brightness AND the circle position
    private func updateSB(value: DragGesture.Value, size: CGSize) {
        // Clamp the drag gesture within the square bounds
        let s = Double(max(0, min(value.location.x / size.width, 1.0)))
        let b = Double(max(0, min(1.0 - (value.location.y / size.height), 1.0)))
        
        // Save the clean point for the UI circle
        selectionPoint = CGPoint(x: value.location.x, y: value.location.y)
        
        selection = Color(hue: hue, saturation: s, brightness: b)
    }
    
    // Updates the color if you only slide the rainbow bar
    private func syncColorFromHue() {
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        NSColor(selection).usingColorSpace(.deviceRGB)?.getHue(nil, saturation: &s, brightness: &b, alpha: &a)// this is the fix
        selection = Color(hue: hue, saturation: Double(s), brightness: Double(b))
    }
    
    // Corrected Initialize Method (Fixes the nil pointer error)
    private func initializeValues() {
        var h: CGFloat = 0 // Fixed: Must provide variable, cannot use nil
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if let nscolor = NSColor(selection).usingColorSpace(.deviceRGB) {
            nscolor.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            hue = Double(h)
            // We can't know the position yet because proxy.size isn't available
        }
    }

    // Helper to flip the circle color for contrast
    private func isColorDark(_ color: Color) -> Bool {
        let nscolor = NSColor(color).usingColorSpace(.deviceRGB) ?? .black
        let lum = (0.299 * nscolor.redComponent) + (0.587 * nscolor.greenComponent) + (0.114 * nscolor.blueComponent)
        return lum < 0.5
    }
}

// NSColor(selection).usingColorSpace(.deviceRGB)?.getHue(nil, saturation: &s, brightness: &b, alpha: &a)
