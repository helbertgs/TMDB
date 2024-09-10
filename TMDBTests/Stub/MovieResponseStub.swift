@testable import TMDB
import Foundation

var movieStub: Movie = {
    .init(
        adult: false,
        backdropPath: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg",
        genres: [ .init(id: 16, name: "Animation"), .init(id: 10751, name: "Family"), .init(id: 12, name: "Adventure"), .init(id: 35, name: "Comedy") ],
        id: 1022789,
        originalTitle: "Inside Out 2",
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        popularity: 1641.74,
        posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
        releaseDate: "2024-06-11",
        title: "Inside Out 2",
        video: false,
        voteAverage: 7.681,
        voteCount: 3427,
        runtime: nil
    )
}()
