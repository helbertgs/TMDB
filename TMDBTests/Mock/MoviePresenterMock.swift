@testable import TMDB
import SwiftUI

@MainActor
final class MoviePresenterMock: MoviePresenterProtocol {
    var view: (any MovieViewProtocol)?
    var isFilteredByUpcomingMovies: Bool = false

    func present(movies: [Movie]) async {
        if isFilteredByUpcomingMovies {
            await view?.update(movies: movies.filter(Formatter.shared.isUpcoming(_:)),
                               isFilteredByUpcomingMovies: isFilteredByUpcomingMovies)
        } else {
            await view?.update(movies: movies,
                               isFilteredByUpcomingMovies: isFilteredByUpcomingMovies)
        }
    }
    
    func present(error: any Error) async {
        await view?.update(error: error)
    }
}
