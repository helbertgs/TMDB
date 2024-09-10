import Foundation
import SwiftUI

@MainActor
final class MovieInteractor: MovieInteractorProtocol {

    var networkService: (any NetworkServiceProtocol)?
    var presenter: (any MoviePresenterProtocol)?
    var page: Int = 1
    var currentPage: Int = 0
    var dataSources = [Movie]()

    func fetchMovies() async {
        if page > currentPage {
            await networkService?.request(MovieEndpoint.popular(page: page)) { result in
                switch result {
                case let .success(data):
                    do {
                        let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                        self.currentPage += 1
                        response.results.forEach(self.insert(_:))
                        await self.presenter?.present(movies: Array(self.dataSources))
                    } catch {
                        await self.presenter?.present(error: error)
                    }
                case let .failure(error):
                    await self.presenter?.present(error: error)
                }
            }
        } else {
            await self.presenter?.present(movies: Array(self.dataSources))
        }
    }

    func insert(_ movie: Movie) {
        if !dataSources.contains(where: { $0.id == movie.id }) {
            dataSources.append(movie)
        }
    }

    func fetchPopularMovies() async {
        self.presenter?.isFilteredByUpcomingMovies = false
        await fetchMovies()
    }

    func fetchUpcomingMovies() async {
        self.presenter?.isFilteredByUpcomingMovies = true
        await fetchMovies()
    }

    func displaying(_ movie: Movie) async {
        if dataSources.last == movie {
            page += 1
            await fetchMovies()
        }
    }
}
