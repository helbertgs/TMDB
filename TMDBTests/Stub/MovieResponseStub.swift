@testable import TMDB
import Foundation

var movieResponseStub: MovieResponse = {
    guard let url = Bundle(for: NetworkServiceMock.self).url(forResource: "nowPlaying", withExtension: "json") else {
        fatalError()
    }

    guard let data = try? Data(contentsOf: url), let response = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
        fatalError()
    }

    return response
}()
