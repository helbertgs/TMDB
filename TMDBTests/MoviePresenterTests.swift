import XCTest
@testable import TMDB

final class MoviePresenterTests: XCTestCase {

    @MainActor
    func testMoviePresenter_present_movies() async throws {
        // Given a MoviePresenter
        let presenter = MoviePresenterSpy()

        // When present function is called
        await presenter.present(movies: [])

        // Then presentCount is equal 1
        XCTAssertEqual(presenter.presentMoviesCount, 1)
    }

    @MainActor
    func testMoviePresenter_present_error() async throws {
        // Given a MoviePresenter
        let presenter = MoviePresenterSpy()

        // When present function is called
        await presenter.present(error: ErrorMock())

        // Then presentCount is equal 1
        XCTAssertEqual(presenter.presentErrorCount, 1)
    }
}
