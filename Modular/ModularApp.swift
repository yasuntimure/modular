//
//  ModularApp.swift
//  Modular
//
//  Created by Eyüp on 2026-05-09.
//

import SwiftUI
import ModularRouter

@main
struct ModularApp: App {

    @State private var router: Router = .init()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
        }
    }
}
