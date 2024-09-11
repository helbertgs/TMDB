@testable import TMDB
import SwiftUI

@MainActor
final class MovieDetailInteractorSpy: MovieDetailInteractorProtocol {
    var networkService: (any NetworkServiceProtocol)?
    var presenter: (any MovieDetailPresenterProtocol)?

    var fetchCastCounter: Int = 0
    var fetchDetailsCounter: Int = 0

    func fetchCast(from movie: Movie) async {
        fetchCastCounter += 1
    }
    
    func fetchDetails(from movie: Movie) async {
        fetchDetailsCounter += 1
    }
}
