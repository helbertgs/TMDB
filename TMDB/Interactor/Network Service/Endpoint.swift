import Foundation

protocol Endpoint {
    var path: String { get }
    var method: NetworkMethod { get }
    var query: [String: Any] { get }
    var header: [String: String] { get }
}
