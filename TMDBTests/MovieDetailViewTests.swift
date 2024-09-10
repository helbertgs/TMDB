final class MovieDetailViewTests: XCTestCase {
    @MainActor
    func testMovieDetailView_update_movie() async throws {
        // Given a MovieDetailView
        let view = MovieDetailViewSpy()

        // When update movie function is called
        await view.update(movie: movieDummy)

        // Then updateMovieCounter is equal 1
        XCTAssertEqual(view.updateMovieCounter, 1)
    }

    @MainActor
    func testMovieDetailView_update_cast() async throws {
        // Given a MovieDetailView
        let view = MovieDetailViewSpy()

        // When update cast function is called
        await view.update(cast: [])

        // Then updateCastCounter is equal 1
        XCTAssertEqual(view.updateCastCounter, 1)
    }

    @MainActor
    func testMovieDetailView_update_error() async throws {
        // Given a MovieDetailView
        let view = MovieDetailViewSpy()

        // When update error function is called
        await view.update(cast: [])

        // Then updateErrorCounter is equal 1
        XCTAssertEqual(view.updateErrorCounter, 1)
    }
}