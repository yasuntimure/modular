import Foundation
import Observation

@MainActor
@Observable
final class RequestDetailViewModel {
    let request: Request
    var isLoading = false
    var errorMessage: String?
    var details: String?
    
    init(request: Request) {
        self.request = request
        loadDetails()
    }
    
    func loadDetails() {
        isLoading = true
        errorMessage = nil
        
        // Simulate API call
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
