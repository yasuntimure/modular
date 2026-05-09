import Testing
@testable import ModularNetwork

@Suite("ModularNetwork")
struct ModularNetworkTests {

    @Test func networkErrorIsError() {
        let error: any Error = NetworkError.invalidURL
        #expect(error is NetworkError)
    }

    @Test func httpMethodRawValues() {
        #expect(HTTPMethod.get.rawValue == "GET")
        #expect(HTTPMethod.post.rawValue == "POST")
        #expect(HTTPMethod.delete.rawValue == "DELETE")
    }
}
