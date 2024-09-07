@testable import TMDB
import SwiftUI

public class NetworkServiceSpy: NetworkServiceProtocol {

    public var scheme: String = ""
    public var domain: String = ""
    public var subdomain: String = ""

    public init() {

    }

    var requestCount: Int = 0
    public func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        requestCount += 1
    }
}
