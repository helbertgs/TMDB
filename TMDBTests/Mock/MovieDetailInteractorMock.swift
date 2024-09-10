@testable import TMDB

final class MovieDetailInteractorMock: MovieDetailInteractorProtocol {
    var networkService: (any NetworkServiceProtocol)?

    var presenter: (any MovieDetailPresenterProtocol)?

    func fetchCast(from movie: Movie) async {
        presenter?.present(cast: castStub)
    }

    func fetchDetails(from movie: Movie) async {
        presenter?.present(movie: movieStub)
    }
}
