@testable import TMDB
import SwiftUI

final class MovieDetailViewSpy: MovieDetailViewProtocol {
    var body: Never { fatalError() }
    var viewModel: MovieDetailViewModel = .init(movie: movieDummy)
    var interactor: (any MovieDetailInteractorProtocol)?

    var updateCastCounter: Int = 0
    var updateMovieCounter: Int = 0
    var updateErrorCounter: Int = 0

    func update(cast: [Cast]) async {
        updateCastCounter += 1
    }
    
    func update(movie: Movie) async {
        updateMovieCounter += 1
    }
    
    func update(error: any Error) async {
        updateErrorCounter += 1
    }
}
