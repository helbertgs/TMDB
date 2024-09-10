import Foundation

public enum MovieEndpoint : Endpoint {

    
    case popular(page: Int)
    case cast(movieId: Int)
    case details(movieId: Int)

    var path: String {
        return switch self {
            case .popular: "movie/popular"
            case let .cast(movieId): "movie/\(movieId)/credits"
            case let .details(movieId): "movie/\(movieId)"
        }
    }

    var query: [String : Any] {
        return switch self {
            case .popular(page: let page): [ "page": page, "language": "en-US" ]
            default: ["language": "en-US" ]
        }
    }

    var header: [String : String] {
        [:]
    }

    var method: NetworkMethod {
        .get
    }
}
