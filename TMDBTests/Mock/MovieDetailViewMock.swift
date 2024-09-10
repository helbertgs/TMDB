@testable import TMDB
import SwiftUI

final class MovieDetailViewMock: MovieDetailViewProtocol {
    var body: Never { fatalError() }
    var viewModel: MovieDetailViewModel
    var interactor: (any MovieDetailInteractorProtocol)?

    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }

    func update(cast: [Cast]) async {
        viewModel.cast = cast
    }

    func update(movie: Movie) async {
        viewModel.movie = movie
    }

    func update(error: any Error) async {
    }
}