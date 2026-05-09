import Foundation

public enum NetworkError: Error, Sendable {
    case invalidURL
    case statusCode(Int)
    case decoding(any Error & Sendable)
    case underlying(any Error & Sendable)
}
