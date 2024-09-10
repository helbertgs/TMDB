import SwiftUI

struct MovieView : View, MovieViewProtocol {

    var interactor: (any MovieInteractorProtocol)?
    @ObservedObject var viewModel = MovieViewModel()
    @State var showAlert: Bool = false
    @State var selectedMovie: Movie?
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation

    let adaptiveColumns = [GridItem(.adaptive(minimum: 150, maximum: 256))]

    var body: some View {
        VStack {
            if viewModel.isLoading == true {
                ProgressView()
            } else {
                buttons
                if orientation.isLandscape {
                    landscapeView
                } else {
                    portraitView
                }
            }
        }
        .onRotate { self.orientation = $0 }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? ""), primaryButton: Alert.Button.default(Text("Try again")), secondaryButton: Alert.Button.destructive(Text("Cancel")))
        }
        .sheet(item: $selectedMovie) {
            self.selectedMovie = nil
        } content: { movie in
            MovieSheetView(movie: movie)
        }
        .task {
            await interactor?.fetchPopularMovies()
        }
    }

    var buttons: some View {
        HStack(spacing: 8) {
            Button(action: { Task { await interactor?.fetchPopularMovies() } }) {
                Text("Popular")
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)

            }
            .frame(width: 88)
            .padding(.all, 4)
            .background(Color.black.opacity(viewModel.isFilteredByUpcomingMovies ? 0.5 : 0.75))
            .cornerRadius(24)

            Button(action: { Task { await interactor?.fetchUpcomingMovies() } }) {
                Text("Upcoming")
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
            }
            .frame(width: 88)
            .padding(.all, 4)
            .background(Color.black.opacity(viewModel.isFilteredByUpcomingMovies ? 0.75 : 0.5))
            .cornerRadius(24)
        }
        .padding(.top, 8)
    }

    var emptyState: some View {
        ContentUnavailableView(
            viewModel.isFilteredByUpcomingMovies ? "Upcoming Movies" : "Popular Movies",
            systemImage: "movieclapper",
            description: Text(viewModel.isFilteredByUpcomingMovies ? "No upcoming movies" : "No popular movies")
        )
    }

    var landscapeView: some View {
        ZStack {
            if viewModel.movies.isEmpty {
                emptyState
            } else {
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top) {
                        ForEach(viewModel.movies, id: \.id) { movie in
                            MovieItemView(movie: movie)
                                .onTapGesture {
                                    self.selectedMovie = movie
                                }.onAppear {
                                    Task {
                                        await interactor?.displaying(movie)
                                    }
                                }
                        }
                    }
                }.padding(.top, 16)
            }
        }
    }

    var portraitView: some View {
        ZStack {
            if viewModel.movies.isEmpty {
                emptyState
            } else {
                ScrollView(.vertical) {
                    LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                        ForEach(viewModel.movies, id: \.id) { movie in
                            MovieItemView(movie: movie)
                                .onTapGesture {
                                    self.selectedMovie = movie
                                }
                                .onAppear {
                                    Task {
                                        await interactor?.displaying(movie)
                                    }
                                }
                        }
                    }
                }.padding(.top, 16)
            }
        }
    }

    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async {
        self.viewModel.movies = movies
        self.viewModel.isFilteredByUpcomingMovies = isFilteredByUpcomingMovies
        self.viewModel.isLoading = false
    }
    
    func update(error: Error) async {
        self.viewModel.error = error
        self.showAlert = true
    }
}

struct MovieSheetView: View {
    var movie: Movie

    var body: some View {
        MovieCoordinator.movieDetail(movie)
    }
}

#Preview {
    MovieCoordinator.movieList()
}
