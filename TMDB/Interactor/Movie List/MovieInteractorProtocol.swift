import SwiftUI

@MainActor
protocol MovieInteractorProtocol {

    var networkService: (any NetworkServiceProtocol)? { get }
    var presenter: (any MoviePresenterProtocol)? { get }
    var page: Int { get set }

    func fetchMovies() async
    func fetchPopularMovies() async
    func fetchUpcomingMovies() async
    func displaying(_ movie: Movie) async
}
