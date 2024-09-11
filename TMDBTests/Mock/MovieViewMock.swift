@testable import TMDB
import SwiftUI

@MainActor
struct MovieViewMock: MovieViewProtocol {
    var viewModel: MovieViewModel = .init()
    
    var interactor: (any MovieInteractorProtocol)?
    
    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async {
        viewModel.movies = movies
        viewModel.isFilteredByUpcomingMovies = isFilteredByUpcomingMovies
    }
    
    func update(error: any Error) async {
        viewModel.error = error
    }
    
    var body: Never {
        fatalError()
    }
}
