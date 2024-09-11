@testable import TMDB
import SwiftUI

@MainActor
struct MovieViewDummy: MovieViewProtocol {
    var body: some View { EmptyView() }
    var viewModel: MovieViewModel = .init()
    var interactor: (any MovieInteractorProtocol)?

    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async { }
    func update(error: any Error) async { }
}
