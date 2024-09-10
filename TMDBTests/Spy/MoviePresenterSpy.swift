@testable import TMDB
import SwiftUI

@MainActor
class MoviePresenterSpy: MoviePresenterProtocol {
    var isFilteredByUpcomingMovies: Bool = false
    var view: (any MovieViewProtocol)?
    var presentMoviesCount: Int = 0
    var presentErrorCount: Int = 0

    func present(movies: [Movie]) async {
        presentMoviesCount += 1
    }

    func present(error: Error) async {
        presentErrorCount += 1
    }
}
