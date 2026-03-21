//
//  ACME_HarmonyApp.swift
//  ACME Harmony
//
//  Created by andy Hazlett on 3/21/26.
//

import SwiftUI

@main
struct ACME_HarmonyApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ACME_HarmonyDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
