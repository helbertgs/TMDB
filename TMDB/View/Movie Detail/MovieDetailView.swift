import SwiftUI

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    @Published var cast: [Cast]

    init(movie: Movie, cast: [Cast] = []) {
        self.movie = movie
        self.cast = cast
    }
}

struct MovieDetailView: View, MovieDetailViewProtocol {
    var interactor: (any MovieDetailInteractorProtocol)?
    @ObservedObject var viewModel: MovieDetailViewModel
    @State var isLoading: Bool = true

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                LazyVStack {
                    HStack {
                        Spacer()
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 24, height:  24)
                            .foregroundStyle(.gray)
                            .onTapGesture { dismiss() }
                    }

                    ImageDownloader
                        .shared
                        .download(image: "/original\(viewModel.movie.backdropPath ?? "")", completion: { isLoading = false })
                        .redacted(reason: isLoading ? .placeholder : .invalidated)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(8)

                    LazyVStack(alignment: .leading, spacing: 8) {
                        Text("\(viewModel.movie.title ?? "") (\(getYearFromReleaseDate(viewModel.movie.releaseDate ?? "")))")
                            .font(Font.system(size: 17, weight: .bold))
                            .foregroundColor(.black)

                        Text("\(getGenresFromMovie(viewModel.movie)) - \(getRunTimeFromMovie(viewModel.movie))")
                            .font(Font.system(size: 11))
                            .foregroundColor(.black)

                        Text("Sinopse")
                            .font(Font.system(size: 14, weight: .bold))
                            .foregroundColor(.black)

                        Text(viewModel.movie.overview ?? "")
                            .font(Font.system(size: 11))
                            .foregroundColor(.black)

                        Text("Elenco")
                            .font(Font.system(size: 14, weight: .bold))
                            .foregroundColor(.black)

                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .top, spacing: 8) {
                                ForEach(viewModel.cast, id: \.self) { actor in
                                    MovieDetailCastView(cast: actor)
                                }
                            }
                        }
                    }
                }
                .padding(.all, 16)
            }
        }
        .task {
            await interactor?.fetchDetails(from: viewModel.movie)
            await interactor?.fetchCast(from: viewModel.movie)
        }
    }

    func update(movie: Movie) async {
        self.viewModel.movie = movie
    }

    func update(cast: [Cast]) async {
        self.viewModel.cast = cast
    }

    func update(error: any Error) async {
    }

    private func getYearFromReleaseDate(_ releaseDate: String?) -> String {
        let oldFormat = DateFormatter()
        oldFormat.dateFormat = "yyyy-MM-dd"

        let newFormat = DateFormatter()
        newFormat.dateFormat = "yyyy"

        guard let releaseDate = releaseDate, let year = oldFormat.date(from: releaseDate) else {
            return newFormat.string(from: Date.now)
        }

        return newFormat.string(from: year)
    }

    private func getGenresFromMovie(_ movie: Movie?) -> String {
        guard let genre = movie?.genres else {
            return ""
        }

        return genre.compactMap {$0.name }.joined(separator: ", ")
    }

    private func getRunTimeFromMovie(_ movie: Movie?) -> String {
        let minutes = movie?.runtime ?? 0
        return String(format: "%02dh %02dm", minutes / 60, minutes % 60)
    }
}

struct MovieDetailCastView : View {
    @State var cast: Cast
    @State var isLoading: Bool = true

    var body: some View {
        VStack {
            ImageDownloader
                .shared
                .download(image: "/w276_and_h350_face\(cast.profilePath ?? "")", completion: { isLoading = false })
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .frame(width: 150, height: 225)
                .background(Color.gray.opacity(0.25))

            Text(cast.name ?? "")
                .multilineTextAlignment(.leading)
                .font(Font.system(size: 12))
                .fontWeight(.bold)
                .frame(width: 150)
                .padding(.top, 2)

            if let characterName = cast.character {
                Text(characterName)
                    .multilineTextAlignment(.leading)
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                    .frame(width: 150)
                    .padding(.bottom, 16)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 8.0)
        )
    }
}
