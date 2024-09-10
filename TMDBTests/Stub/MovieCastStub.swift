@testable import TMDB
import Foundation

var movieCastStub: MovieCast = {
    .init(id: 1, cast: [
        .init(
            adult: nil,
            gender: 1,
            id: 56322,
            knownForDepartment: .acting,
            name: "Amy Poehler",
            originalName: "Amy Poehler",
            popularity: nil,
            profilePath: "/rwmvRonpluV6dCPiQissYrchvSD.jpg",
            castID: nil,
            character: "Joy (voice)",
            creditID: nil,
            order: nil,
            department: nil,
            job: nil
        ),
        .init(
            adult: nil,
            gender: 1,
            id: 1903874,
            knownForDepartment: .acting,
            name: "Maya Hawke",
            originalName: "Maya Hawke",
            popularity: nil,
            profilePath: "/wWvtHBYDXIcpdjXmKAYUqsOXI17.jpg",
            castID: nil,
            character: "Anxiety (voice)",
            creditID: nil,
            order: nil,
            department: nil,
            job: nil
        ),
        .init(
            adult: nil,
            gender: 1,
            id: 3020876,
            knownForDepartment: .acting,
            name: "Kensington Tallman",
            originalName: "Kensington Tallman",
            popularity: nil,
            profilePath: "/tBqawwg2VJq1V4mZjAOFQ7fnXNW.jpg",
            castID: nil,
            character: "Riley (voice)",
            creditID: nil,
            order: nil,
            department: nil,
            job: nil
        )
    ], crew: [])
}()
