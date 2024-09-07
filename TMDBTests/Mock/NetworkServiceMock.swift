@testable import TMDB
import Foundation

public class NetworkServiceMock: NetworkServiceProtocol {
    public var scheme: String = ""

    public var subdomain: String = ""

    public var domain: String = ""

    public func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: endpoint.path, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }

        completion(.failure(ErrorMock(code: -1, description: "Invalid URL")))
    }
}
