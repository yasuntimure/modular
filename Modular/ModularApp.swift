//
//  ModularApp.swift
//  Modular
//
//  Created by Eyüp on 2026-05-09.
//

import SwiftUI
import ModularRouter
import ModularUI

@main
struct ModularApp: App {

    @State private var router: Router = .init()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                RequestsView(viewModel: makeRequestsViewModel())
                    .navigationDestination(for: Route.self) { route in
                        destination(for: route)
                    }
            }
        }
    }

    private func makeRequestsViewModel() -> RequestsViewModel {
        RequestsViewModel { [router] request in
            router.push(Route.requestDetail(request: request))
        }
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .requests:
            RequestsView(viewModel: makeRequestsViewModel())
        case .requestDetail(let request):
            RequestDetailView(request: request)
        }
    }
}
