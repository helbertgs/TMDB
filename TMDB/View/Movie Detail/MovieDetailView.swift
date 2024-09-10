import SwiftUI

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var cast: [Cast] = []
}

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel = .init()
    @State var isLoading: Bool = true

    var body: some View {
        if let movie = viewModel.movie {
            ScrollView(.vertical) {
                VStack {
                    ImageDownloader
                        .shared
                        .download(backdrop: movie, completion: { isLoading = false })
                        .redacted(reason: isLoading ? .placeholder : .invalidated)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 256)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(movie.originalTitle ?? "") (\(getYearFromReleaseDate(movie.releaseDate)))")
                            .font(Font.system(size: 17, weight: .bold))
                            .foregroundColor(.black)

                        Text(movie.genreIDS!.compactMap {$0.name }.joined(separator: ", "))
                            .font(Font.system(size: 11))
                            .foregroundColor(.black)

                        Text("Sinopse")
                            .font(Font.system(size: 14, weight: .bold))
                            .foregroundColor(.black)

                        Text(movie.overview ?? "")
                            .font(Font.system(size: 11))
                            .foregroundColor(.black)

                        if !viewModel.cast.isEmpty {
                            Text("Elenco")
                                .font(Font.system(size: 14, weight: .bold))
                                .foregroundColor(.black)

                            ScrollView(.horizontal) {
                                HStack(alignment: .top, spacing: 8) {
                                    ForEach(viewModel.cast, id: \.id) { actor in
                                        MovieDetailCastView(cast: actor)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.all, 16)
            }
        }
        else {
            ContentUnavailableView("Movie not found", systemImage: "movieclapper")
        }
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
}

struct MovieDetailCastView : View {
    @State var cast: Cast
    @State var isLoading: Bool = true

    var body: some View {
        VStack {
            ImageDownloader
                .shared
                .download(image: cast.profilePath ?? "", completion: { isLoading = false })
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .frame(width: 150, height: 225)
                .background(Color.gray.opacity(0.25))

            Text(cast.name ?? "")
                .multilineTextAlignment(.leading)
                .font(Font.system(size: 12))
                .fontWeight(.bold)
                .frame(width: 150)
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .padding(.top, 2)

            if let characterName = cast.character {
                Text(characterName)
                    .multilineTextAlignment(.leading)
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                    .frame(width: 150)
                    .redacted(reason: isLoading ? .placeholder : .invalidated)
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

#Preview {
    MovieDetailView()
}
