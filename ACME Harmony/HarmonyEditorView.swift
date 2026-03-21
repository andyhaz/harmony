//
//  HarmonyEditorView.swift
//  ACME Harmony
//
//  Created by andy Hazlett on 3/21/26.
//
import SwiftUI

struct HarmonyEditorView: View {
    @Binding var document: ACME_HarmonyDocument
    @StateObject private var manager = HarmonyManager()

    var body: some View {
        HStack(spacing: 0) {
            // Main Canvas Area (Changes color on manager update)
            ZStack {
                manager.baseColor.ignoresSafeArea()
                
                Text(manager.hexString)
                    .font(.system(size: 64, weight: .black, design: .monospaced))
                    .foregroundColor(isColorDark(manager.baseColor) ? .white : .black)
                    .opacity(0.8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // The Tools Sidebar (Right)
            VStack(alignment: .leading, spacing: 20) {
                Text("HARMONY PRO TOOLS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.secondary)
                
                // Call our new interactive picker
                HarmonyColorPicker(selection: $manager.baseColor)
                
                Divider()
                
                VStack(spacing: 10) {
                    InfoRow(label: "HEX", value: manager.hexString)
                    InfoRow(label: "RGB", value: manager.rgbString)
                }
                .padding(10)
                .background(Color.black.opacity(0.1))
                .cornerRadius(6)

                Spacer()
                
                // Save button uses your preferred green accent
                Button("Update Harmony Document") {
                    document.text = manager.hexString
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .controlSize(.large)
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(width: 250) // Fixed sidebar width like professional design tools
            .background(.ultraThinMaterial) // Gives that frosty glass look
        }
    }

    private func isColorDark(_ color: Color) -> Bool {
        let nscolor = NSColor(color).usingColorSpace(.deviceRGB) ?? .black
        let lum = (0.299 * nscolor.redComponent) + (0.587 * nscolor.greenComponent) + (0.114 * nscolor.blueComponent)
        return lum < 0.5
    }
}

// Small layout helper
struct InfoRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack {
            Text(label).font(.caption2).bold().foregroundColor(.secondary)
            Spacer()
            Text(value).font(.system(.body, design: .monospaced))
        }
    }
}
