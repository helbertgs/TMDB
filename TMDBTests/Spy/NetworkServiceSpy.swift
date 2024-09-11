@testable import TMDB
import SwiftUI

@MainActor
final class NetworkServiceSpy: NetworkServiceProtocol {

    var scheme: String = ""
    var domain: String = ""
    var subdomain: String = ""

    init() { }

    var requestCount: Int = 0
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) async -> Void) async {
        requestCount += 1
    }
}
