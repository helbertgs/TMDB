@testable import TMDB
import SwiftUI

@MainActor
class MovieInteractorMock: MovieInteractorProtocol {
    var presenter: (any MoviePresenterProtocol)?
    var networkService: (any NetworkServiceProtocol)?
    var page: Int = 1

    func fetchMovies() async {
        await networkService?.request(EndpointMock(path: "popular")) { response in
            switch response {
            case let .success(data):
                do {
                    let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
                    await self.presenter?.present(movies: decoded.results)
                } catch {
                    await self.presenter?.present(error: error)
                }
            case let .failure(error):
                await self.presenter?.present(error: error)
            }
        }
    }

    func fetchPopularMovies() async {
        presenter?.isFilteredByUpcomingMovies = false
        await fetchMovies()
    }

    func fetchUpcomingMovies() async {
        presenter?.isFilteredByUpcomingMovies = true
        await fetchMovies()
    }

    func displaying(_ movie: Movie) async {
        page += 1
        await fetchMovies()
    }
}
