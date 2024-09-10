import Foundation

@MainActor
class MoviePresenter: MoviePresenterProtocol {

    var view: (any MovieViewProtocol)?
    var isFilteredByUpcomingMovies: Bool = false

    func present(movies: [Movie]) async {
        if isFilteredByUpcomingMovies {
            await view?.update(movies: movies.filter(Formatter.shared.isUpcoming(_:)), isFilteredByUpcomingMovies: isFilteredByUpcomingMovies)
        } else {
            await view?.update(movies: movies, isFilteredByUpcomingMovies: isFilteredByUpcomingMovies)
        }
    }
    func present(error: Error) async {
        await view?.update(error: error)
    }
}
