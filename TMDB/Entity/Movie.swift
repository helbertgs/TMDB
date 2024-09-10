struct Movie: Codable, Equatable, Hashable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genres: [Genre]?
    let id: Int
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let runtime: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video, runtime
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Genre: Codable, Equatable, Hashable {
    let id: Int
    let name: String
}
