@testable import TMDB

final class MovieDetailPresenterDummy: MovieDetailPresenterProtocol {
    var view: (any MovieDetailViewProtocol)?
    
    func present(cast: [Cast]) async { }
    func present(movie: Movie) async { }
    func present(error: any Error) async { }
}
