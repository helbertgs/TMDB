import SwiftUI

@MainActor
final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var networkService: (any NetworkServiceProtocol)?
    var presenter: (any MovieDetailPresenterProtocol)?

    func fetchCast(from movie: Movie) async {
        await networkService?.request(MovieEndpoint.cast(movieId: movie.id)) { result in
            switch result {
            case let .success(data):
                do {
                    let response = try JSONDecoder().decode(MovieCast.self, from: data)
                    await self.presenter?.present(cast: response.cast)
                } catch {
                    await self.presenter?.present(error: error)
                }
            case let .failure(error):
                await self.presenter?.present(error: error)
            }
        }
    }

    func fetchDetails(from movie: Movie) async {
        await networkService?.request(MovieEndpoint.details(movieId: movie.id)) { result in
            switch result {
            case let .success(data):
                do {
                    let response = try JSONDecoder().decode(Movie.self, from: data)
                    await self.presenter?.present(movie: response)
                } catch {
                    await self.presenter?.present(error: error)
                }
            case let .failure(error):
                await self.presenter?.present(error: error)
            }
        }
    }
}
