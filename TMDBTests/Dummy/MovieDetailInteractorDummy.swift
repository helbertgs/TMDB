@testable import TMDB

final class MovieDetailInteractorDummy: MovieDetailInteractorProtocol {
    var networkService: (any NetworkServiceProtocol)?
    var presenter: (any MovieDetailPresenterProtocol)?
    func fetchCast(from movie: Movie) async { }
    func fetchDetails(from movie: Movie) async { }
}
