@testable import TMDB
import Foundation

var movieCastStub: MovieCast = {
    guard let url = Bundle(for: NetworkServiceMock.self).url(forResource: "credits", withExtension: "json") else {
        fatalError()
    }

    guard let data = try? Data(contentsOf: url), let response = try? JSONDecoder().decode(MovieCast.self, from: data) else {
        fatalError()
    }

    return response
}()
