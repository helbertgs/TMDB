import XCTest
@testable import TMDB

final class MovieInteractorTests: XCTestCase {
    func testMovieInteractor() throws {
        let interactor = MovieInteractorMock(presenter: MoviePresenterDummy(), networkService: NetworkServiceDummy())
    }
}
