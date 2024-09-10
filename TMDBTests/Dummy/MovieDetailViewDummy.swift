@testable import TMDB
import SwiftUI

final class MovieDetailViewDummy: MovieDetailViewProtocol {
    var body: Never { fatalError() }
    var viewModel: MovieDetailViewModel = .init(movie: movieDummy)
    var interactor: (any MovieDetailInteractorProtocol)?

    func update(cast: [Cast]) async { }
    func update(movie: Movie) async { }
    func update(error: any Error) async { }
}
