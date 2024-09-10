import Foundation

@MainActor
final class NetworkService : NetworkServiceProtocol {

    var scheme: String = "https"
    var subdomain: String = "api"
    var domain: String = "themoviedb.org"

    func request(_ endpoint: any Endpoint, completion: @escaping (Result<Data, Error>) async -> Void) async {
        Task {
            let components = getComponents(by: endpoint)
            let urlRequest = getURLRequest(by: endpoint, and: components)

            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                await completion(.success(data))
                return
            }

            await completion(.failure(NetworkError.invalidData))
        }
    }

    func getComponents(by endpoint: Endpoint) -> URLComponents {
        guard var components = URLComponents(string: "\(scheme)://\(subdomain).\(domain)/3/\(endpoint.path)") else {
            return URLComponents()
        }

        components.queryItems = endpoint.query.compactMap { URLQueryItem(name: $0.key, value: "\($0.value)") }
        return components
    }

    func getURLRequest(by endpoint: Endpoint, and components: URLComponents) -> URLRequest {
        guard let url = components.url else { return URLRequest(url: URL(filePath: "")) }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MTYwYTJmNzk2MGNmNDJjY2M0M2FjMjI2YzQ0NWU4MyIsIm5iZiI6MTcyNTU2MTA4Ni44NzExMTksInN1YiI6IjY2ZDhlMTk3OTRmYTQzODhlNDAxNzkzMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xpfc6Ug2XRUT2hplR79QOO9sBytwlASgH_VwZons3xo"
        ]
        return request
    }
}
