import Foundation

@MainActor
struct Request: Identifiable, Hashable, Sendable {
    let id: String
    let title: String
    let description: String
    let status: RequestStatus
    let createdAt: Date
    
    enum RequestStatus: String, Sendable {
        case pending
        case inProgress = "in_progress"
        case completed
        case failed
    }
}
