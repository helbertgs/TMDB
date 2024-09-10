import SwiftUI

@MainActor
protocol MovieViewModelProtocol: ObservableObject {
    var movies: [Movie] { get set }
    var isFilteredByUpcomingMovies: Bool { get set }
    var error: Error? { get set }
    var isLoading: Bool { get set }
}

@MainActor
public class MovieViewModel: MovieViewModelProtocol, ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isFilteredByUpcomingMovies: Bool = false
    @Published var error: Error?
    @Published var isLoading: Bool = false
}
