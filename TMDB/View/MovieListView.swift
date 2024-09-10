struct MovieListView : View {

    @State var movies: Binding<[Movie]>
    @State var showAlert: Bool = false
    @State var selectedMovie: Movie?
    @State var orientation = UIDeviceOrientation.portrait
    let title: String
    let image: String
    let adaptiveColumns = [GridItem(.adaptive(minimum: 170, maximum: 256))]

    var body: some View {
        ZStack {
            if movies.isEmpty {
                ContentUnavailableView(title, systemImage: image, description: Text("No data avaiable"))
            } else {
                if orientation.isLandscape {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(movies.wrappedValue, id: \.id) { movie in
                                MovieItemView(movie: movie)
                                    .onTapGesture {
                                        showAlert.toggle()
                                    }
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                            ForEach(movies.wrappedValue, id: \.id) { movie in
                                MovieItemView(movie: movie)
                                    .onTapGesture {
                                        showAlert.toggle()
                                    }
                            }
                        }
                    }
                }
            }
        }
            .onRotate { self.orientation = $0 }
    }
}