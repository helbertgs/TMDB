@testable import TMDB
import SwiftUI

@MainActor
final class MovieCoordinatorFake {
    static func movieList() -> any MovieViewProtocol {
        var view = MovieViewMock()
        let presenter = MoviePresenterMock()
        let networkService = NetworkServiceMock()
        let interactor = MovieInteractorMock()

        view.interactor = interactor
        interactor.presenter = presenter
        interactor.networkService = networkService
        presenter.view = view

        return view
    }

    static func movieDetail(_ movie: Movie) -> any MovieDetailViewProtocol {
        let view = MovieDetailViewMock(viewModel: MovieDetailViewModel(movie: movie))
        let presenter = MovieDetailPresenterMock()
        let networkService = NetworkServiceMock()
        let interactor = MovieDetailInteractorMock()

        view.interactor = interactor
        interactor.presenter = presenter
        interactor.networkService = networkService
        presenter.view = view

        return view
    }
}
