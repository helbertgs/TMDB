import XCTest
@testable import TMDB

final class MovieInteractorTests: XCTestCase {

    func testMoviesInteractor_fetchMovies() throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy(presenter: MoviePresenterDummy(), networkService: NetworkServiceDummy())

        // When fetchMovies function is called
        interactor.fetchMovies()

        // Then fetchMoviesCounter is equal 1
        XCTAssertEqual(interactor.fetchMoviesCounter, 1)
    }

    func testMoviesInteractor_filterPopularMovies() throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy(presenter: MoviePresenterDummy(), networkService: NetworkServiceDummy())

        // When filterPopularMovies function is called
        interactor.filterPopularMovies()

        // Then filterPopularMoviesCounter is equal 1
        XCTAssertEqual(interactor.filterPopularMoviesCounter, 1)
    }

    func testMoviesInteractor_filterUpcomingMovies() throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy(presenter: MoviePresenterDummy(), networkService: NetworkServiceDummy())

        // When filterUpcomingMovies function is called
        interactor.filterUpcomingMovies()

        // Then filterUpcomingMoviesCounter is equal 1
        XCTAssertEqual(interactor.filterUpcomingMoviesCounter, 1)
    }
}
