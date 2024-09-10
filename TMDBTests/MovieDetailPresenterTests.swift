import XCTest
@testable import TMDB

final class MovieDetailPresenterTests: XCTestCase {

    @MainActor
    func testMovieDetailPresenter_present_movie() async throws {
        // Given a MovieDetailPresenter
        let presenter = MovieDetailPresenterSpy()
        presenter.view = MovieDetailViewDummy()

        // When present movie function is called
        await presenter.present(movie: movieDummy)

        // Then presentMovieCounter is equal 1
        XCTAssertEqual(presenter.presentMovieCounter, 1)
    }

    @MainActor
    func testMovieDetailPresenter_present_cast() async throws {
        // Given a MovieDetailPresenter
        let presenter = MovieDetailPresenterSpy()
        presenter.view = MovieDetailViewDummy()

        // When present cast function is called
        await presenter.present(cast: [])

        // Then presentCastCounter is equal 1
        XCTAssertEqual(presenter.presentCastCounter, 1)
    }

    @MainActor
    func testMovieDetailPresenter_present_error() async throws {
        // Given a MovieDetailPresenter
        let presenter = MovieDetailPresenterSpy()
        presenter.view = MovieDetailViewDummy()

        // When present error function is called
        await presenter.present(error: ErrorMock())

        // Then presentErrorCounter is equal 1
        XCTAssertEqual(presenter.presentErrorCounter, 1)
    }
}

