@testable import TMDB
import Foundation

class NetworkServiceMock: NetworkServiceProtocol {
    var scheme: String = ""
    var subdomain: String = ""
    var domain: String = ""

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) async -> Void) async {
        if let url = Bundle(for: NetworkServiceMock.self).url(forResource: endpoint.path, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                await completion(.success(data))
            } catch {
                await completion(.failure(error))
            }

            return
        }

        await completion(.failure(ErrorMock(code: -1, description: "Invalid URL")))
    }
}
