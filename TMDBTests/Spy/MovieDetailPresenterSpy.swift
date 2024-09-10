@testable import TMDB

final class MovieDetailPresenterSpy: MovieDetailPresenterProtocol {
    var view: (any MovieDetailViewProtocol)?

    var presentCastCounter: Int = 0
    var presentMovieCounter: Int = 0
    var presentErrorCounter: Int = 0

    func present(cast: [Cast]) async {
        presentCastCounter += 1
    }
    
    func present(movie: Movie) async {
        presentMovieCounter += 1
    }
    
    func present(error: any Error) async {
        presentErrorCounter += 1
    }
}
