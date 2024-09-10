@testable import TMDB
import Foundation

class NetworkServiceDummy: NetworkServiceProtocol {
    var scheme: String = ""
    var subdomain: String = ""
    var domain: String = ""

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) async -> Void) async { }
}
