import XCTest
@testable import TMDB

final class MovieDetailInteractorTests: XCTestCase {

    @MainActor
    func testMovieDetailInteractor_fetchDetails() async throws {
        // Given a MovieDetailInteractor
        let interactor = MovieDetailInteractorSpy()
        interactor.presenter = MovieDetailPresenterDummy()
        interactor.networkService = NetworkServiceDummy()

        // When fetchDetails function is called
        await interactor.fetchDetails(from: movieDummy)

        // Then fetchDetailsCounter is equal 1
        XCTAssertEqual(interactor.fetchDetailsCounter, 1)
    }

    @MainActor
    func testMovieDetailInteractor_fetchCast() async throws {
        // Given a MovieDetailInteractor
        let interactor = MovieDetailInteractorSpy()
        interactor.presenter = MovieDetailPresenterDummy()
        interactor.networkService = NetworkServiceDummy()

        // When fetchCast function is called
        await interactor.fetchCast(from: movieDummy)

        // Then fetchCastCounter is equal 1
        XCTAssertEqual(interactor.fetchCastCounter, 1)
    }
}
