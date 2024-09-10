@testable import TMDB
import XCTest

final class NetworkServiceTests: XCTestCase {

    @MainActor
    func testNetworkService_request() async throws {
        // Given a NetworkService
        let networkService = NetworkServiceSpy()

        // When request function is called
        await networkService.request(EndpointDummy(), completion: { _ in })

        // Then requestCount is equal 1
        XCTAssertEqual(networkService.requestCount, 1)
    }

    @MainActor
    func testNetworkService_request_nowPlaying() async throws {
        // Given a NetworkService
        let networkService = NetworkServiceMock()

        // When request function is called
        await networkService.request(EndpointMock(path: "popular")) { result in

            switch result {
            case let .success(data):
                XCTAssertNotNil(data)
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, "")
            }
        }
    }

    @MainActor
    func testNetworkService_request_details() async throws {
        // Given a NetworkService
        let networkService = NetworkServiceMock()

        // When request function is called
        await networkService.request(EndpointMock(path: "details")) { result in

            switch result {
            case let .success(data):
                XCTAssertNotNil(data)
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, "")
            }
        }
    }

    @MainActor
    func testNetworkService_request_credits() async throws {
        // Given a NetworkService
        let networkService = NetworkServiceMock()

        // When request function is called
        await networkService.request(EndpointMock(path: "cast")) { result in

            switch result {
            case let .success(data):
                XCTAssertNotNil(data)
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, "")
            }
        }
    }
}
