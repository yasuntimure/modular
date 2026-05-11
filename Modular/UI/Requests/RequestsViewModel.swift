import Foundation
import Observation
import ModularRouter

@MainActor
@Observable
final class RequestsViewModel {
    var requests: [Request] = []
    var isLoading = false
    var errorMessage: String?

    private let router: Router

    init(router: Router) {
        self.router = router
        loadRequests()
    }

    func selectRequest(_ request: Request) {
        router.push(Route.requestDetail(request: request))
    }
    
    func loadRequests() {
        isLoading = true
        errorMessage = nil
        
        // Simulate API call with dummy data
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.requests = [
                Request(
                    id: "1",
                    title: "Fetch User Profile",
                    description: "GET /api/user/profile",
                    status: .completed,
                    createdAt: Date().addingTimeInterval(-3600)
                ),
                Request(
                    id: "2",
                    title: "Update Settings",
                    description: "POST /api/settings",
                    status: .inProgress,
                    createdAt: Date().addingTimeInterval(-1800)
                ),
                Request(
                    id: "3",
                    title: "Delete Cache",
                    description: "DELETE /api/cache",
                    status: .pending,
                    createdAt: Date()
                ),
                Request(
                    id: "4",
                    title: "Sync Data",
                    description: "PUT /api/sync",
                    status: .failed,
                    createdAt: Date().addingTimeInterval(-7200)
                ),
            ]
            self?.isLoading = false
        }
    }
}
