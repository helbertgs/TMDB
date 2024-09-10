import SwiftUI

struct MovieView : View, MovieViewProtocol {

    var interactor: (any MovieInteractorProtocol)?
    @ObservedObject var viewModel = MovieViewModel()
    @State var showAlert: Bool = false
    @State var selectedMovie: Movie?
    @State var orientation = UIDeviceOrientation.portrait

    let adaptiveColumns = [GridItem(.adaptive(minimum: 170, maximum: 256))]

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Button(action: { Task { await interactor?.fetchPopularMovies() } }) {
                    Text("Popular")
                        .foregroundStyle(Color.white)
                }
                .frame(width: 96)
                .padding(.all, 8)
                .background(Color.black.opacity(viewModel.isFilteredByUpcomingMovies ? 0.5 : 0.75))
                .cornerRadius(16)

                Button(action: { Task { await interactor?.fetchUpcomingMovies() } }) {
                    Text("Upcoming")
                        .foregroundStyle(Color.white)
                }
                .frame(width: 96)
                .padding(.all, 8)
                .background(Color.black.opacity(viewModel.isFilteredByUpcomingMovies ? 0.75 : 0.5))
                .cornerRadius(16)
            }
            .padding(.top, 40)

            if viewModel.movies.isEmpty {
                ContentUnavailableView("Test", systemImage: "folder", description: Text("No data avaiable"))
            } else {
                if orientation.isLandscape {
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.movies, id: \.id) { movie in
                                MovieItemView(movie: movie)
                                    .onTapGesture {
                                        print("tapped")
                                        self.selectedMovie = movie
                                    }.onAppear {
                                        Task {
                                            await interactor?.displaying(movie)
                                        }
                                    }
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                            ForEach(viewModel.movies, id: \.id) { movie in
                                MovieItemView(movie: movie)
                                    .onTapGesture {
                                        print("tapped")
                                        self.selectedMovie = movie
                                    }
                                    .onAppear {
                                        Task {
                                            await interactor?.displaying(movie)
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
        .onRotate { self.orientation = $0 }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? ""), primaryButton: Alert.Button.default(Text("Try again")), secondaryButton: Alert.Button.destructive(Text("Cancel")))
        }
        .sheet(item: $selectedMovie) {
            self.selectedMovie = nil
        } content: { content in
            let view = MovieDetailView()
            view.viewModel.movie = content

            return view
        }
        .task {
            await interactor?.fetchPopularMovies()
        }
    }

    func update(movies: [Movie], isFilteredByUpcomingMovies: Bool) async {
        print("\(Self.self).\(#function)")
        self.viewModel.movies = movies
        self.viewModel.isFilteredByUpcomingMovies = isFilteredByUpcomingMovies
    }
    
    func update(error: Error) async {
        print("\(Self.self).\(#function)")
        self.viewModel.error = error
        self.showAlert = true
    }
}
