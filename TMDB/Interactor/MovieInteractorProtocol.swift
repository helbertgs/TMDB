import SwiftUI

public protocol MovieInteractorProtocol {

    var networkService: NetworkServiceProtocol { get }
    var presenter: MoviePresenterProtocol { get }
    var page: Int { get set }
    var lang: String { get set }

    init(presenter: MoviePresenterProtocol, networkService: NetworkServiceProtocol)

    func fetchMovies()
    func filterPopularMovies()
    func filterUpcomingMovies()
}
