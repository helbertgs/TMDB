@testable import TMDB

@MainActor
class MoviePresenterDummy: MoviePresenterProtocol {
    var isFilteredByUpcomingMovies: Bool = false
    var view: (any MovieViewProtocol)?

    func present(movies: [TMDB.Movie]) async { }
    func present(error: Error) async { }
}
