@testable import TMDB
import XCTest

final class NetworkServiceTests: XCTestCase {

    func testNetworkService_request() throws {
        // Given a NetworkService
        let networkService = NetworkServiceSpy()

        // When request function is called
        networkService.request(EndpointDummy(), completion: { _ in })

        // Then requestCount is equal 1
        XCTAssertEqual(networkService.requestCount, 1)
    }
}
