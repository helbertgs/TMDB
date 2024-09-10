@testable import TMDB
import Foundation

struct EndpointMock: Endpoint {
    var method: NetworkMethod = .get
    var query: [String : Any] = [:]
    var header: [String : String] = [:]
    var path: String

    init(path: String) {
        self.path = path
    }
}
