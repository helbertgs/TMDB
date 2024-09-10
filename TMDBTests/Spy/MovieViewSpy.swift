@testable import TMDB
import SwiftUI

final class MovieViewSpy: MovieViewProtocol {
    var viewModel: MovieViewModel = MovieViewModel()
    var interactor: (any MovieInteractorProtocol)?

    var updateMoviesCounter: Int = 0
    var updateErrorCounter: Int = 0

    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async {
        updateMoviesCounter += 1
    }
    
    func update(error: any Error) async {
        updateErrorCounter += 1
    }

    var body: some View {
        EmptyView()
    }
}
