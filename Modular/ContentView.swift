//
//  ContentView.swift
//  Modular
//
//  Created by Eyüp on 2026-05-09.
//

import SwiftUI
import ModularRouter

struct ContentView: View {

    @Environment(Router.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationDestination(for: Route.self) { route in
                destination(for: route)
            }
        }
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .home:
            Text("Home")
        case .settings:
            Text("Settings")
        case .detail(let id):
            Text("Detail: \(id)")
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
