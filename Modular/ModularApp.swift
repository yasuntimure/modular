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
            NavigationStack(path: $router.path) {
                RequestsView(viewModel: RequestsViewModel(router: router))
                    .navigationDestination(for: Route.self) { route in
                        destination(for: route)
                    }
            }
        }
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .requests:
            let viewModel = RequestsViewModel(router: router)
            RequestsView(viewModel: viewModel)
        case .requestDetail(let request):
            RequestDetailView(request: request)
        }
    }
}
