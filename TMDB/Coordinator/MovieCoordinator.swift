import SwiftUI

@MainActor
class MovieRouter {
    init() {

    }

    static func movieList() -> some View {
        var view = MovieView()
        let presenter = MoviePresenter()
        let networkService = NetworkService()
        let interactor = MovieInteractor()

        view.interactor = interactor
        interactor.presenter = presenter
        interactor.networkService = networkService
        presenter.view = view

        return view
    }

    static func movieDetail(_ movie: Movie) -> some View {
        var view = MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))
        let presenter = MovieDetailPresenter()
        let networkService = NetworkService()
        let interactor = MovieDetailInteractor()

        view.interactor = interactor
        interactor.presenter = presenter
        interactor.networkService = networkService
        presenter.view = view

        return view
    }
}
