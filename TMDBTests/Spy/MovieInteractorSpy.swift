@testable import TMDB
import SwiftUI

public class MovieInteractorSpy: MovieInteractorProtocol {

    public var presenter: any MoviePresenterProtocol
    public var networkService: any NetworkServiceProtocol
    public var page: Int = 0
    public var lang: String = ""

    public required init(presenter: any MoviePresenterProtocol, networkService: any NetworkServiceProtocol) {
        self.presenter = presenter
        self.networkService = networkService
    }

    var fetchMoviesCounter: Int = 0

    public func fetchMovies() {
        fetchMoviesCounter += 1
    }

    var filterPopularMoviesCounter: Int = 0
    public func filterPopularMovies() {
        filterPopularMoviesCounter += 1
    }

    var filterUpcomingMoviesCounter: Int = 0
    public func filterUpcomingMovies() {
        filterUpcomingMoviesCounter += 1
    }
}
