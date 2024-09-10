import SwiftUI

@MainActor
final class ImageDownloader {

    var cache: [String: Image] = [:]

    static let shared = ImageDownloader()

    @MainActor func download(poster movie: Movie, completion: @escaping () -> Void) -> some View {
        download(image: "/w440_and_h660_face\(movie.posterPath ?? "")", completion: completion)
    }

    @MainActor func download(backdrop movie: Movie, completion: @escaping () -> Void) -> some View {
        download(image: "/original\(movie.backdropPath ?? "")", completion: completion)
    }

    @MainActor func download(image path: String, completion: @escaping () -> Void) -> some View {
        if let image = cache[path] {
            return AnyView(
                image
                    .resizable()
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
                url: URL(string: "https://image.tmdb.org/t/p\(path)")!,
//                https://image.tmdb.org/t/p/6s6oav541p7xspCG6PvXut7knkP.jpg
                content: { image in
                    self.cache[path] = image
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
