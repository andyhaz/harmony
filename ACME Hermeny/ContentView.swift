//
//  ContentView.swift
//  ACME Hermeny
//
//  Created by andy Hazlett on 3/22/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: ACME_HarmonyDocument

    var body: some View {
        // We just call our new separate file here
        HarmonyEditorView(document: $document)
    }
}

#Preview {
    ContentView(document: .constant(ACME_HarmonyDocument()))
}

