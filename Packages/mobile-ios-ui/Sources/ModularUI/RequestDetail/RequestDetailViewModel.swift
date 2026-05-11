import Foundation
import Observation

@MainActor
@Observable
public final class RequestDetailViewModel {
    public let request: Request
    public var isLoading = false
    public var errorMessage: String?
    public var details: String?

    public init(request: Request) {
        self.request = request
        loadDetails()
    }

    public func loadDetails() {
        isLoading = true
        errorMessage = nil

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.details = """
            Request ID: \(self?.request.id ?? "")
            Method: \(self?.request.description ?? "")
            Status: \(self?.request.status.rawValue ?? "")
            Created: \(self?.request.createdAt.formatted() ?? "")

            Response: {
              "success": true,
              "data": { "message": "Operation completed successfully" }
            }
            """
            self?.isLoading = false
        }
    }
}
