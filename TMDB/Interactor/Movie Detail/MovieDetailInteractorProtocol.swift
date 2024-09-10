import SwiftUI

@MainActor
protocol MovieDetailInteractorProtocol {
    var networkService: (any NetworkServiceProtocol)? { get }
    var presenter: (any MovieDetailPresenterProtocol)? { get }
    func fetchCast(from movie: Movie) async
    func fetchDetails(from movie: Movie) async
}
