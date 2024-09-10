@testable import TMDB
import Foundation

final class MovieDetailInteractorMock: MovieDetailInteractorProtocol {
    var networkService: (any NetworkServiceProtocol)?
    var presenter: (any MovieDetailPresenterProtocol)?

    func fetchCast(from movie: Movie) async {
        await networkService?.request(EndpointMock(path: "cast")) { response in
            switch response {
            case let .success(data):
                do {
                    let decoded = try JSONDecoder().decode(MovieCast.self, from: data)
                    await self.presenter?.present(cast: decoded.cast)
                } catch {
                    await self.presenter?.present(error: error)
                }
            case let .failure(error):
                await self.presenter?.present(error: error)
            }
        }
    }

    func fetchDetails(from movie: Movie) async {
        await networkService?.request(EndpointMock(path: "details")) { response in
            switch response {
            case let .success(data):
                do {
                    let decoded = try JSONDecoder().decode(Movie.self, from: data)
                    await self.presenter?.present(movie: decoded)
                } catch {
                    await self.presenter?.present(error: error)
                }
            case let .failure(error):
                await self.presenter?.present(error: error)
            }
        }
    }
}
