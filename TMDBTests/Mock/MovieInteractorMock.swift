@testable import TMDB
import SwiftUI

class MovieInteractorMock: MovieInteractorProtocol {

    
    var presenter: (any MoviePresenterProtocol)?
    var networkService: (any NetworkServiceProtocol)?
    var page: Int = 0
    var lang: String = ""

    func fetchMovies() async {
        page += 1
        lang = "en-US"

        await networkService?.request(EndpointMock(path: "nowPlaying")) { _ in }
    }

    func fetchPopularMovies() async { }
    func fetchUpcomingMovies() async { }
    func displaying(_ movie: Movie) async { }
}
