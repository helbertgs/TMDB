@testable import TMDB

@MainActor
final class MovieDetailPresenterMock: MovieDetailPresenterProtocol {
    var view: (any MovieDetailViewProtocol)?

    func present(cast: [Cast]) async {
        await view?.update(cast: cast)
    }

    func present(movie: Movie) async {
        await view?.update(movie: movie)
    }

    func present(error: any Error) async {
        await view?.update(error: error)
    }
}
