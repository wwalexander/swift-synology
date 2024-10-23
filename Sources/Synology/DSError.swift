struct DSError: Equatable, RawRepresentable, Decodable, Error {
    var rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }

    init(from decoder: any Decoder) throws {
        self.rawValue = try decoder.singleValueContainer().decode(Int.self)
    }

    static var unknownError: Self { .init(rawValue: 100) }
    static var invalidParameter: Self { .init(rawValue: 101) }
    static var requestedAPIDoesNotExist: Self { .init(rawValue: 102) }
    static var requestedMethodDoesNotExist: Self { .init(rawValue: 103) }
    static var requestedVersionDoesNotSupportFunctionality: Self { .init(rawValue: 104) }
    static var loggedInSessionDoesNotHavePermission: Self { .init(rawValue: 105) }
    static var sessionTimeout: Self { .init(rawValue: 106) }
    static var sessionInterruptedByDuplicateLogin: Self { .init(rawValue: 107) }

    var localizedDescription: String {
        switch self {
        case .unknownError: "Unknown error"
        case .invalidParameter: "Invalid paramter"
        case .requestedAPIDoesNotExist: "The requested API does not exist"
        case .requestedMethodDoesNotExist: "The requested method does not exist"
        case .requestedVersionDoesNotSupportFunctionality: "The requested version does not support the functionality"
        case .loggedInSessionDoesNotHavePermission: "The logged in session does not have permission"
        case .sessionTimeout: "Session timeout"
        case .sessionInterruptedByDuplicateLogin: "Session interrupted by duplicate login"
        default: "\(rawValue)"
        }
    }
}
