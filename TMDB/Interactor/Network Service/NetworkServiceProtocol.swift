import Foundation

@MainActor
protocol NetworkServiceProtocol {

    var scheme: String { get }
    var subdomain: String { get }
    var domain: String { get }

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) async -> Void) async
}
