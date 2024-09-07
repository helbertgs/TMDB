@testable import TMDB
import SwiftUI

public class MovieInteractorMock: MovieInteractorProtocol {

    public var presenter: any MoviePresenterProtocol
    public var networkService: any NetworkServiceProtocol

    public required init(presenter: any MoviePresenterProtocol, networkService: any NetworkServiceProtocol) {
        self.presenter = presenter
        self.networkService = networkService
    }
}
