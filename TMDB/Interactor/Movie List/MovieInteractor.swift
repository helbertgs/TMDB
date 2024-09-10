import SwiftUI

@MainActor
final class MovieInteractor: MovieInteractorProtocol {

    var networkService: (any NetworkServiceProtocol)?
    var presenter: (any MoviePresenterProtocol)?
    var page: Int = 1
    var currentPage: Int = 0
    var dataSources = Set<Movie>()

    func fetchMovies() async {
        print("\(Self.self).\(#function)")
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
            print("\(Self.self).\(#function) = \(movie.title ?? "")")
            dataSources.insert(movie)
        }
    }

    func fetchPopularMovies() async {
//        print("\(Self.self).\(#function)")
        self.presenter?.isFilteredByUpcomingMovies = false
        await fetchMovies()
    }

    func fetchUpcomingMovies() async {
//        print("\(Self.self).\(#function)")
        self.presenter?.isFilteredByUpcomingMovies = true
        await fetchMovies()
    }

    func fetchFavoriteMovies() async {
//        print("\(Self.self).\(#function)")
    }

    func displaying(_ movie: Movie) async {
//        print("\(Self.self).\(#function) = \(movie.title ?? "")")
        if Array(dataSources).last == movie {
            page += 1
            await fetchMovies()
        }
    }
}
