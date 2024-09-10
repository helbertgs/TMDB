import SwiftUI

@main
struct TMDBApp: App {
    var body: some Scene {
        WindowGroup {
            MovieCoordinator.movieList()
        }
    }
}
