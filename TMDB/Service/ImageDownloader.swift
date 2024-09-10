@MainActor
final class ImageDownloader {

    var cache: [String: Image] = [:]

    static let shared = ImageDownloader()

    @MainActor func download(_ movie: Movie, completion: @escaping () -> Void) -> some View {
        if let image = cache[movie.posterPath] {
            return AnyView(
                image.resizable()
                .scaledToFill()
                .task {
                    await MainActor.run {
                        completion()
                    }
                }
            )
        }

        return AnyView(
            AsyncImage(
                url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath)")!,
                content: { image in
                    self.cache[movie.posterPath] = image
                    print(self.cache)

                    return image
                        .resizable()
                        .scaledToFill()
                        .task {
                            await MainActor.run {
                                completion()
                            }
                        }
                },
                placeholder: {
                    ProgressView()
                }
            )
        )
    }
}