import XCTest
@testable import TMDB

final class MovieInteractorTests: XCTestCase {

    @MainActor
    func testMovieInteractor_fetchMovies() async throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy()
        interactor.presenter = MoviePresenterDummy()
        interactor.networkService = NetworkServiceDummy()

        // When fetchMovies function is called
        await interactor.fetchMovies()

        // Then fetchMoviesCounter is equal 1
        XCTAssertEqual(interactor.fetchMoviesCounter, 1)
    }

    @MainActor
    func testMovieInteractor_fetchPopularMovies() async throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy()
        interactor.presenter = MoviePresenterDummy()
        interactor.networkService = NetworkServiceDummy()

        // When fetchPopularMovies function is called
        await interactor.fetchPopularMovies()

        // Then filterPopularMoviesCounter is equal 1
        XCTAssertEqual(interactor.fetchPopularMoviesCounter, 1)
    }

    @MainActor
    func testMovieInteractor_fetchUpcomingMovies() async throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy()
        interactor.presenter = MoviePresenterDummy()
        interactor.networkService = NetworkServiceDummy()

        // When fetchUpcomingMovies function is called
        await interactor.fetchUpcomingMovies()

        // Then fetchUpcomingMoviesCounter is equal 1
        XCTAssertEqual(interactor.fetchUpcomingMoviesCounter, 1)
    }

    @MainActor
    func testMovieInteractor_displaying() async throws {
        // Given a MovieInteractor
        let interactor = MovieInteractorSpy()
        interactor.presenter = MoviePresenterDummy()
        interactor.networkService = NetworkServiceDummy()

        // When displaying function is called
        await interactor.displaying(movieDummy)

        // Then displayingCounter is equal 1
        XCTAssertEqual(interactor.displayingCounter, 1)
    }
}
