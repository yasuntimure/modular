import Foundation

public struct Request: Identifiable, Hashable, Sendable {
    public let id: String
    public let title: String
    public let description: String
    public let status: RequestStatus
    public let createdAt: Date

    public init(id: String, title: String, description: String, status: RequestStatus, createdAt: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.status = status
        self.createdAt = createdAt
    }

    public enum RequestStatus: String, Sendable {
        case pending
        case inProgress = "in_progress"
        case completed
        case failed
    }
}
