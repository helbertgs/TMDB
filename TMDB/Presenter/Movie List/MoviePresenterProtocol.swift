import Foundation

@MainActor
protocol MoviePresenterProtocol {
    var view: (any MovieViewProtocol)? { get }
    var isFilteredByUpcomingMovies: Bool { get set }

    func present(movies: [Movie]) async
    func present(error: Error) async
}
