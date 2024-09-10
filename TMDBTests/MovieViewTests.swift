@testable import TMDB
import XCTest

final class MovieViewTests: XCTestCase {

    @MainActor
    func testMovieView_updateMovies() async throws {
        // Given a MovieView
        let view = MovieViewSpy()

        // When update movies function is called
        await view.update(movies: [], isFilteredByUpcomingMovies: false)

        // Then updateMoviesCounter is equal 1
        XCTAssertEqual(view.updateMoviesCounter, 1)
    }

    @MainActor
    func testMovieView_updateError() async throws {
        // Given a MovieView
        let view = MovieViewSpy()

        // When update error function is called
        await view.update(error: ErrorMock())

        // Then updateErrorCounter is equal 1
        XCTAssertEqual(view.updateErrorCounter, 1)
    }

    @MainActor
    func testMovieView_integration() async throws {
        // Given a View, Interactor, Presenter and Services
        var view = MovieViewMock()
        let interactor = MovieInteractorMock()
        let presenter = MoviePresenterMock()
        let networkService = NetworkServiceMock()

        view.interactor = interactor
        interactor.presenter = presenter
        interactor.networkService = networkService
        presenter.view = view

        // When update fetchMovies function is called
        await interactor.fetchMovies()

        // Then will display 20 movies
        XCTAssertEqual(view.viewModel.movies.count, 20)
    }
}
