import SwiftUI

protocol MovieDetailViewProtocol : View {
    var viewModel: MovieDetailViewModel { get set }
    var interactor: (any MovieDetailInteractorProtocol)? { get set }

    func update(cast: [Cast]) async
    func update(movie: Movie) async
    func update(error: Error) async
}
