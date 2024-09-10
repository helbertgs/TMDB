import SwiftUI

//@MainActor
protocol MovieViewProtocol : View {
    var viewModel: MovieViewModel { get set }
    var interactor: (any MovieInteractorProtocol)? { get set }

    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async
    func update(error: Error) async
}
