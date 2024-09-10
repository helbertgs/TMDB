@testable import TMDB
import SwiftUI

struct MovieViewDummy: MovieViewProtocol {

    
    var viewModel: MovieViewModel = .init()
    var interactor: (any MovieInteractorProtocol)?
    var body: some View {
        EmptyView()
    }

    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async { }
    func update(error: any Error) async { }
}
