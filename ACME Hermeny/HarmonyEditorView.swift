//
//  HarmonyEditorView.swift
//  ACME Harmony
//
//  Created by andy Hazlett on 3/21/26.
//
import SwiftUI
import UniformTypeIdentifiers

struct HarmonyEditorView: View {
    @Binding var document: ACME_HarmonyDocument
    @StateObject private var manager = HarmonyManager()
    @State private var isExportingCSS = false

    var body: some View {
        HStack(spacing: 0) {
            // Main Canvas Area
            ZStack {
                manager.baseColor.ignoresSafeArea()
                
                Text(manager.hexString)
                    .font(.system(size: 64, weight: .black, design: .monospaced))
                    .foregroundColor(isColorDark(manager.baseColor) ? .white : .black)
                    .opacity(0.8)
                    .onTapGesture { copyToClipboard(manager.hexString) }
                    .help("Click to copy Hex code")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // The Tools Sidebar
            VStack(alignment: .leading, spacing: 20) {
                Text("HARMONY PRO TOOLS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.secondary)
                
                HarmonyColorPicker(selection: $manager.baseColor)
                
                Divider()
                
                VStack(spacing: 10) {
                    InfoRow(label: "HEX", value: manager.hexString)
                    InfoRow(label: "RGB", value: manager.rgbString)
                    InfoRow(label: "UPDATED", value: document.lastModified.formatted(date: .omitted, time: .shortened))
                }
                .padding(10)
                .background(Color.black.opacity(0.1))
                .cornerRadius(6)

                Spacer()
                
                VStack(spacing: 10) {
                    Button(action: { copyToClipboard(manager.hexString) }) {
                        Label("Copy Hex", systemImage: "number.square.fill").frame(maxWidth: .infinity)
                    }
                    Button(action: { copyToClipboard(manager.rgbString) }) {
                        Label("Copy RGB", systemImage: "paintpalette.fill").frame(maxWidth: .infinity)
                    }
                    Button(action: { isExportingCSS = true }) {
                        Label("Export CSS", systemImage: "doc.text.fill").frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .padding()
            .frame(width: 250)
            .background(.ultraThinMaterial)
        }
        .onAppear {
            // Sync file data to the UI on open
            if !document.hexColor.isEmpty {
                manager.baseColor = Color(hex: document.hexColor)
            }
        }
        // After the main HStack closing brace
                .onAppear {
                    // This pulls the data FROM the file INTO the picker on startup
                    if !document.hexColor.isEmpty {
                        manager.baseColor = Color(hex: document.hexColor)
                    }
                }
                .onChange(of: manager.baseColor) { _ in
                    // This saves the picker color TO the file as you move it
                    document.hexColor = manager.hexString
                    document.lastModified = Date()
                }
        .fileExporter(
            isPresented: $isExportingCSS,
            document: CSSFile(text: manager.cssContent),
            contentType: .plainText,
            defaultFilename: "harmony-styles.css"
        ) { _ in }
    }

    private func copyToClipboard(_ text: String) {
        #if os(iOS)
        UIPasteboard.general.string = text
        #else
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
        #endif
    }

    private func isColorDark(_ color: Color) -> Bool {
        #if os(iOS)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        UIColor(color).getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = (0.299 * r) + (0.587 * g) + (0.114 * b)
        #else
        let nscolor = NSColor(color).usingColorSpace(.deviceRGB) ?? .black
        let lum = (0.299 * nscolor.redComponent) + (0.587 * nscolor.greenComponent) + (0.114 * nscolor.blueComponent)
        #endif
        return lum < 0.5
    }
}

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
