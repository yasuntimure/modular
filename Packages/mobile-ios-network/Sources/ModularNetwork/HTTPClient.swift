import Foundation

public protocol HTTPClient: Sendable {

    func send<R: NetworkRequest>(_ request: R, baseURL: URL) async throws -> R.Response
}

public struct URLSessionHTTPClient: HTTPClient {

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func send<R: NetworkRequest>(_ request: R, baseURL: URL) async throws -> R.Response {
        guard let url = URL(string: request.path, relativeTo: baseURL) else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        request.headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }

        let (data, response) = try await session.data(for: urlRequest)

        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            throw NetworkError.statusCode(http.statusCode)
        }

        do {
            return try JSONDecoder().decode(R.Response.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
