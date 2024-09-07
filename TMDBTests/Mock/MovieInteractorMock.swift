@testable import TMDB
import SwiftUI

public class MovieInteractorMock: MovieInteractorProtocol {

    public var presenter: any MoviePresenterProtocol
    public var networkService: any NetworkServiceProtocol
    public var page: Int = 0
    public var lang: String = ""

    public required init(presenter: any MoviePresenterProtocol, networkService: any NetworkServiceProtocol) {
        self.presenter = presenter
        self.networkService = networkService
    }

    public func fetchMovies() {
        page += 1
        lang = "en-US"
    }

    public func filterPopularMovies() {
    }

    public func filterUpcomingMovies() {
    }
}
