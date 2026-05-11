import Foundation
import Observation

@MainActor
@Observable
public final class RequestsViewModel {
    public var requests: [Request] = []
    public var isLoading = false
    public var errorMessage: String?

    private let onSelectRequest: (Request) -> Void

    public init(onSelectRequest: @escaping (Request) -> Void) {
        self.onSelectRequest = onSelectRequest
        loadRequests()
    }

    public func selectRequest(_ request: Request) {
        onSelectRequest(request)
    }

    public func loadRequests() {
        isLoading = true
        errorMessage = nil

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
