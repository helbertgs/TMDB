import XCTest
@testable import TMDB

final class MovieCoordinatorTests: XCTestCase {
    @MainActor
    func testMovieCoordinator_factory_view() async throws {
        // Give a view created by MovieCoordinator
        let view = MovieCoordinatorFake.movieList()
        let interactor = view.interactor
        let presenter = interactor?.presenter

        // When fetchMovies function is called
        await view.interactor?.fetchMovies()

        // Then View, Presenter and Interactor is not null
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter?.view)
    }

    @MainActor
    func testMovieCoordinator_movieList_integration_fetchPopularMovies() async throws {
        // Give a view created by MovieCoordinator
        let view = MovieCoordinatorFake.movieList()

        // When fetchPopularMovies function is called
        await view.interactor?.fetchPopularMovies()

        // Then
        // Interactor - Page is equal 1
        XCTAssertEqual(view.interactor?.page, 1)

        // Presenter - isFilteredByUpcomingMovies is equal false
        XCTAssertEqual(view.interactor?.presenter?.isFilteredByUpcomingMovies, false)

        // View/ViewModel - Movies count is equal 20 and isFilteredByUpcomingMovies is equal false
        XCTAssertEqual(view.viewModel.movies.count, 20)
        XCTAssertEqual(view.viewModel.isFilteredByUpcomingMovies, false)
    }

    @MainActor
    func testMovieCoordinator_movieList_integration_fetchUpcomingMovies() async throws {
        // Give a view created by MovieCoordinator
        let view = MovieCoordinatorFake.movieList()

        // When fetchUpcomingMovies function is called
        await view.interactor?.fetchUpcomingMovies()

        // Then
        // Interactor - Page is equal 1
        XCTAssertEqual(view.interactor?.page, 1)

        // Presenter - isFilteredByUpcomingMovies is equal true
        XCTAssertEqual(view.interactor?.presenter?.isFilteredByUpcomingMovies, true)

        // View/ViewModel - Movies count is equal 0 and isFilteredByUpcomingMovies is equal true
        XCTAssertEqual(view.viewModel.movies.count, 0)
        XCTAssertEqual(view.viewModel.isFilteredByUpcomingMovies, true)
    }

    @MainActor
    func testMovieCoordinator_movieDetail_integration_fetchDetails() async throws {
        // Give a view detail created by MovieCoordinator
        let view = MovieCoordinatorFake.movieDetail(movieStub)

        // When fetchPopularMovies function is called
        await view.interactor?.fetchDetails(from: movieStub)

        // Then the runtime is different from the initial value
        XCTAssertNotEqual(view.viewModel.movie.runtime, movieStub.runtime)
    }

    @MainActor
    func testMovieCoordinator_movieDetail_integration_fetchCast() async throws {
        // Give a view detail created by MovieCoordinator
        let view = MovieCoordinatorFake.movieDetail(movieStub)

        // When fetchCast function is called
        await view.interactor?.fetchCast(from: movieStub)

        // Then the cast is not empty
        XCTAssertNotEqual(view.viewModel.cast, [])
    }
}
