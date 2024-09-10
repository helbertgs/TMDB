import Foundation

@MainActor
protocol MovieDetailPresenterProtocol {
    var view: (any MovieDetailViewProtocol)? { get }

    func present(cast: [Cast]) async
    func present(movie: Movie) async
    func present(error: Error) async
}
