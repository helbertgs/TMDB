import Foundation

struct ErrorMock: Error {
    let code: Int
    let description: String

    init(code: Int = 0, description: String = "") {
        self.code = code
        self.description = description
    }
}
