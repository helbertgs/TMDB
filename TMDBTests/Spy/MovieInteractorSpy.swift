@testable import TMDB
import SwiftUI

class MovieInteractorSpy: MovieInteractorProtocol {

    

    var presenter: (any MoviePresenterProtocol)?
    var networkService: (any NetworkServiceProtocol)?
    var page: Int = 0
    var lang: String = ""

    var fetchPopularMoviesCounter: Int = 0
    var fetchMoviesCounter: Int = 0
    var fetchUpcomingMoviesCounter: Int = 0
    var displayingCounter: Int = 0

    func fetchMovies() async {
        fetchMoviesCounter += 1
    }

    func fetchPopularMovies() async {
        fetchPopularMoviesCounter += 1
    }

    func fetchUpcomingMovies() async {
        fetchUpcomingMoviesCounter += 1
    }

    func displaying(_ movie: TMDB.Movie) async {
        displayingCounter += 1
    }
}
