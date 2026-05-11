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
            VStack(spacing: 24) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")

                NavigationLink(value: Route.requests) {
                    Label("View Requests", systemImage: "list.bullet")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                }
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
        case .requests:
            RequestsView()
        case .requestDetail(let request):
            RequestDetailView(request: request)
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
