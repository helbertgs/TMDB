import SwiftUI

public protocol MovieInteractorProtocol {

    var networkService: NetworkServiceProtocol { get }
    var presenter: MoviePresenterProtocol { get }

    init(presenter: MoviePresenterProtocol, networkService: NetworkServiceProtocol)
}
