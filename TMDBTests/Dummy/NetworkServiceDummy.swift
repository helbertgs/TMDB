@testable import TMDB
import Foundation

public class NetworkServiceDummy: NetworkServiceProtocol {
    public var scheme: String = ""

    public var subdomain: String = ""

    public var domain: String = ""

    public func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
    }
}
