final class Formatter {

    static let shared = Formatter()

    lazy var defaultDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()

    lazy var requiredDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        return formatter
    }()

    func format(_ str: String) -> String {
        guard let date = defaultDateFormat.date(from: str) else { return str }
        return requiredDateFormat.string(from: date)
    }
}
