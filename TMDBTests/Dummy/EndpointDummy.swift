@testable import TMDB

struct EndpointDummy: Endpoint {
    var method: NetworkMethod = .get
    
    var query: [String : Any] = [:]

    var header: [String : String] = [:]

    var path: String = ""
}
